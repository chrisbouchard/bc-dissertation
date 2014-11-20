#!/usr/bin/env zsh

while kqwait output/Thesis.pdf
do
    sleep 5
    make view
done

