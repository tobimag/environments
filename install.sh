#!/usr/bin/env bash


usage() { echo -n "$0 [OPTION]...

 Options:
 -b     replace .bashrc
 -g     replace .gitconfig
 -v     replace .vimrc
"; exit 0; }

while getopts "bgv" o; do
    case "${o}" in
        b)
            b=1
            ;;
        g)
            g=1
            ;;
        v)
            v=1
            ;;
    esac
done
shift $((OPTIND-1))

[ $# -eq 0 ] && usage

[ ! -z $b ] && ln -s $(pwd)/.bashrc ~/.bashrc --backup
[ ! -z $g ] && ln -s $(pwd)/.gitconfig ~/.gitconfig --backup
[ ! -z $v ] && ln -s $(pwd)/.vimrc ~/.vimrc --backup
