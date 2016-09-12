#!/bin/sh

# syntax highlight:
# ./start.sh | pygmentize -l xml

p1="aaa";
p2="first line
second line
third line";
p3="a & b >> OMG <<";

export PARAMETER_LISTER_OUTPUT="output.XmlOutput";
dub build > /dev/null;
./parameter-listerd "$p1" "$p2" "$p3";
