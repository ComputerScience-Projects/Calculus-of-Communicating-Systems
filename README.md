# Calculus of Communicating Systems
## Introduction
The calculus of communicating systems (CCS) is a process calculus introduced by [Robin Milner](https://it.wikipedia.org/wiki/Robin_Milner) around 1980 and the title of a [book](https://www.springer.com/la/book/9783540102359) describing the calculus. Its actions model indivisible communications between exactly two participants. The formal language includes primitives for describing parallel composition, the choice between actions and scope restriction. CCS is useful for evaluating the qualitative correctness of properties of a system such as a deadlock or livelock.

# Description
This program calculates the abstract tree of the computation performed by the rules of the Calculus of Communication System created by Robin Milner.<br/>
You can print the abstract tree.<br/>
For more information about Calculus of Communication System<br/>
You can find more information in the [pdf file](htps://github.com/andreabac3/Calculus-of-Communicating-Systems/blob/master/ccs.pdf) 

#### An example is:
```sh

 _ --> (a!.0 | (c?.0 + b!.0))
   !a --> (0 | (c?.0 + b!.0))
      _ --> (0 | c?.0)
         ?c --> (0 | 0)
      _ --> (0 | b!.0)
         !b --> (0 | 0)
   _ --> (a!.0 | c?.0)
      ?c --> (0 | a!.0)
         !a --> (0 | 0)
      !a --> (c?.0 | 0)
         ?c --> (0 | 0)
   _ --> (a!.0 | b!.0)
      !a --> (0 | b!.0)
         !b --> (0 | 0)
      !b --> (a!.0 | 0)
         !a --> (0 | 0)
```
## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

You must be able to run .sml files (Standard ML of New Jersey).

* You can install from [smlnj.org](https://www.smlnj.org/) the SML compiler it's available for UNIX & Windows System. After the installation
```sh
     $ sml ccs.sml 
```

* Otherwise, you can execute it in the online compiler on the
[website](https://www.tutorialspoint.com/execute_smlnj_online.php) by copying it to it and then pressing the play button.


## Running the tests

To run a test, use this synopsis.
Example: 
```sh
; val programExample = Par (
    Output_proc ("a", Empty_proc),
    Or (Input_proc ("a", Empty_proc), Output_proc ("a", Empty_proc))
    )

; (print or tree_to_string or eval_ccs) programExample
```
[example of result](https://github.com/andreabac3/Calculus-of-Communicating-Systems/blob/master/README.md#an-example-is)

The form of the parameters is specified in the abstract algebra:
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
