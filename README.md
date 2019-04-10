# Calculus of Communicating Systems

The calculus of communicating systems (CCS) is a process calculus introduced by Robin Milner around 1980 and the title of a book describing the calculus. Its actions model indivisible communications between exactly two participants. The formal language includes primitives for describing parallel composition, the choice between actions and scope restriction. CCS is useful for evaluating the qualitative correctness of properties of a system such as a deadlock or livelock.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

You must be able to run .sml files (Standard ML of New Jersey).

* You can install from https://www.smlnj.org/ the SML compiler it's available for UNIX & Windows System. After the installation
```sh
     $ sml ccs.sml 
```

* Otherwise, you can execute it in the online compiler on the website https://www.tutorialspoint.com/execute_smlnj_online.php by copying it to it and then pressing the play button.


## Running the tests

To run a test, use this synopsis.
Example:
```sh
; val program = Par (
    Output_proc ("a", Empty_proc),
    Or (Input_proc ("a", Empty_proc), Output_proc ("a", Empty_proc))
    )

; (print or tree_to_string or eval_ccs) program
```

The form of the parameters is specified in the abstract algebra 
```sh
; datatype process = Empty_proc
    | Input_proc of channel * process
    | Output_proc of channel * process
    | Or of process * process
    | Par of process * process
```

## Authors

* **Alessandro Scandone**  - [Github profile](https://github.com/andreabac3)
* **Andrea Bacciu**  [Github profile](https://github.com/andreabac3)
* **Valerio Neri**  [Github profile](https://github.com/andreabac3)

See also the list of [contributors](https://github.com/andreabac3/Calculus-of-Communicating-Systems/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
