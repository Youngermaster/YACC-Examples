#!/bin/bash
set -e

bison -d calc.y
cc calc.tab.c -o calc -ll
