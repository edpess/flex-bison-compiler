#!/bin/bash

bison -d -v -g matrix.y 

flex matrix.l

cc lex.yy.c matrix.tab.c -o analizer -lfl -lm

dot -T png -O matrix.dot
xdg-open matrix.dot
xdg-open matrix.dot.png

echo
echo "Use ./analizer to start the program"
echo



