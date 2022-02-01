#!/bin/bash
# Thiago Almeida
# thiagodons@gmail.com

site=$1
ext=$2

main(){
    echo "Fazendo a busca de $ext para o endereço $site"
    busca="https://www.google.com/search?q=site:$site+ext:$ext"
    lynx --dump $busca | grep "$ext" | cut -d "=" -f 2 | egrep -v "site|google" | cut -d "&" -f 1
}

if [ "$1" == "" ] || [ "$2" == "" ] ; then
    echo "Forma de uso: ./extrator.sh www.site.com pdf"
else
    main
fi

