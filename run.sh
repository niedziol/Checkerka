#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
COLOR_OFF='\033[0m'

clang++ -o optimal source/optimal.cpp
clang++ -o slow source/slow.cpp
clang++ -o gen source/gen.cpp

mv slow files
mv optimal files
mv gen files

for((i = 1; i <= 1000000; i++))
do
    ./files/gen $i > files/test.in
    ./files/optimal < files/test.in > files/opt.out
    ./files/slow < files/test.in > files/slo.out
    if diff -w -Z files/slo.out files/opt.out > files/error.out
    then
        echo -e "${COLOR_OFF}Running test number "$i"   ${GREEN}[OK]"
    else
        echo -e "${COLOR_OFF}Running test number "$i"   ${RED}[WA]"
        echo -e "${COLOR_OFF}Wrong answer found, do you want to see the difference? [y/n]"
        read ifprint
        if [ $ifprint == 'y' ] || [ $ifprint == 'Y' ]
        then 
            echo
            cat files/error.out
        fi
        echo
        break
    fi
done

rm files/slow
rm files/optimal
rm files/gen
rm files/error.out
    
