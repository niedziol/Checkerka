#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
COLOR_OFF='\033[0m'

clang++ -o optimal *optimal.cpp
clang++ -o slow *slow.cpp
clang++ -o gen gen.cpp

for((i = 1; i <= 1000000; i++))
do
    ./gen $i > test.in
    ./optimal < test.in > opt.out
    ./slow < test.in > slo.out
    if diff -w -Z slo.out opt.out > error
    then
        echo -e "${COLOR_OFF}Running test number "$i"   ${GREEN}[OK]"
    else
        echo -e "${COLOR_OFF}Running test number "$i"   ${RED}[WA]"
        echo -e "${COLOR_OFF}Wrong answer found, do you want to see the difference? [y/n]"
        read ifprint
        if [ $ifprint == 'y' ] || [ $ifprint == 'Y' ]
        then 
            echo
            cat error
        fi
        echo
        break
    fi
done

rm slow
rm optimal
rm gen
rm error
    
