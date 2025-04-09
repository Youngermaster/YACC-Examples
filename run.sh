#!/bin/bash
set -e

bison -d calc.y
flex calc.l
cc lex.yy.c calc.tab.c -o calc -ll
