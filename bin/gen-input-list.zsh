#!/usr/bin/env zsh

chapters_dir=$1

for file in $chapters_dir/*
do
    printf '\\input{%s}\n' $file
done

