# FMS: a Force Method Solver

![tests](https://github.com/jorgepz/Force-Method-Solver/workflows/tests/badge.svg)
[![License](https://img.shields.io/badge/License-GPLv3-green.svg)](https://github.com/jorgepz/Force-Method-Solver/blob/main/LICENSE)


## What is FMS?

FMS is a GNU-Octave code for solving 2D truss problems using the [Force Method](https://en.wikipedia.org/wiki/Unit_dummy_force_method). The main variables are normal forces in truss elements, and support reactions. The code generates simple plots like this on 

![fig example 1](examples/Example_1_forces.png)

## Why?

The purpose of this repo is to provide an example of a computational implementation of the Force Method for 2D truss structures. The code is oriented to undergraduate Civil Engineering students, in particular students at [Facultad de Ingeniería, UdelaR](https://www.fing.edu.uy/) in Uruguay.

## How to use it?

 1. download and unzip the code https://github.com/jorgepz/Force-Method-Solver/archive/refs/heads/main.zip
 1. open GNU-Octave or Matlab and move to the `examples` folder and run one of the scripts

## How it works?

The mechanics of the code and the theory of the method are based on the textbook of the course Resistencia de Materiales 2, publicly available at [this repo](https://gitlab.fing.edu.uy/jorgepz/libroResMat2/).

## Who?

By the moment this code is being developed by [Jorge Pérez Zerpa](https://www.fing.edu.uy/~jorgepz/), but any contribution is welcome, by forking this repo and crontributing your changes after. Please look for open issues if you want to solve currently open tasks/problems.