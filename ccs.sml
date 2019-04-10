; type channel = string

; datatype process = Empty_proc
    | Input_proc of channel * process
    | Output_proc of channel * process
    | Or of process * process
    | Par of process * process

; datatype tree = Node of process * branch list
    and label = NONE | Out of channel | In of channel | Tau
    and branch = Branch of label * tree

; fun children Empty_proc = []
    | children (Input_proc (ch, p)) = [(In ch, p)]
    | children (Output_proc (ch, p)) = [(Out ch, p)]
    | children (Or (p, q)) = [(NONE, p), (NONE, q)]
    | children (Par (p, q)) =
        (case (p, q) of
            (Input_proc (chP, p'), Output_proc (chQ, q')) =>
                if chP = chQ then
                    (Tau, Par(p', q')) ::
                    map (fn (label, p') => (label, Par (p', q))) (children p) @
                    map (fn (label, q') => (label, Par (p, q'))) (children q)
                else
                    map (fn (label, p') => (label, Par (p', q))) (children p) @
                    map (fn (label, q') => (label, Par (p, q'))) (children q)
            | (Output_proc (_, _), Input_proc (_, _)) => children (Par (q, p))
            | _ =>
                map (fn (label, p') => (label, Par (p', q))) (children p) @
                map (fn (label, q') => (label, Par (p, q'))) (children q))

; fun eval_ccs p = Node(p, map (fn (l, p') => Branch (l, eval_ccs p')) (children p))

; fun program_to_string Empty_proc = "0"
    | program_to_string (Input_proc (ch, pr)) = ch ^ "?." ^ program_to_string pr
    | program_to_string (Output_proc (ch, pr)) = ch ^ "!." ^ program_to_string pr
    | program_to_string (Or (p, q)) = "(" ^ program_to_string p ^ " + " ^ program_to_string q ^ ")"
    | program_to_string (Par (p, q)) = "(" ^ program_to_string p ^ " | " ^ program_to_string q ^ ")"

; fun label_to_str NONE = "_"
    | label_to_str (Out ch) = "!" ^ ch
    | label_to_str (In ch) = "?" ^ ch
    | label_to_str Tau = "Tau"

; fun tree_to_string tree =
    let
        fun repeat 0 str = ""
            | repeat n str = str ^ (repeat (n - 1) str)
        fun recursion label (Node (p, children)) level =
            repeat level "   "
          ^ label_to_str label 
          ^ " --> "
          ^ program_to_string p
          ^ (concat o map (fn Branch (ch', tree) => "\n" ^ recursion ch' tree (level + 1))) children
    in recursion NONE tree 0 end

(* Examples *)

; val p1 = Input_proc ("a", Empty_proc)

; val p2 = Or(Input_proc ("a", Empty_proc), Output_proc("b", Empty_proc))

; val p3 = Par (
    Output_proc ("a", Empty_proc),
    Or (Input_proc ("c", Empty_proc), Output_proc("b", Empty_proc)))

; val p4 = Par (
    Output_proc ("a", Empty_proc),
    Or (Input_proc ("a", Empty_proc), Output_proc("a", Empty_proc)))


; (print o tree_to_string o eval_ccs) p3
