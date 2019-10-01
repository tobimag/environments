#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

usage() { echo -n "$0 [OPTION]...

 Options:
 -b     replace .bashrc
 -g     replace .gitconfig
 -t     replace .tmux.conf
 -v     replace .vimrc
"; exit 0; }

install_bash() {
   ln -s $DIR/.bashrc ~/.bashrc --backup
   ln -s $DIR/.bash_git_functions ~/.bash_git_functions --backup
   touch ~/.bashrc_local
   echo "GLOBAL_ALIASES=$DIR/.bash_aliases
if [ -f \${GLOBAL_ALIASES} ]; then
   source \${GLOBAL_ALIASES}
fi" >> ~/.bash_aliases
}

[ $# -eq 0 ] && usage

while getopts "bgtv" o; do
    case "${o}" in
        b)
            b=1
            ;;
        g)
            g=1
            ;;
        t)
            t=1
            ;;
        v)
            v=1
            ;;
    esac
done
shift $((OPTIND-1))

[ ! -z $b ] && install_bash
[ ! -z $g ] && ln -s $DIR/.gitconfig ~/.gitconfig --backup
[ ! -z $t ] && ln -s $DIR/.tmux.conf ~/.tmux.conf --backup && ln -s $DIR/.tmux.theme ~/.tmux.theme --backup
[ ! -z $v ] && ln -s $DIR/.vimrc ~/.vimrc --backup
