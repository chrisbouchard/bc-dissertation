#!/usr/bin/env zsh

chapters_dir=$1

for file in $chapters_dir/*.tex
do
    printf '\\include{%s}\n' ${file%.*}
done

