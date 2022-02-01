#!/bin/bash
# Thiago Almeida
# thiagodons@gmail.com

site=$1
ext=$2

main(){
    echo oi
}

if [ "$1" == "" ] || [ "$2" == "" ] ; then
    echo "Forma de uso: ./extrator.sh www.site.com pdf"
else
    main
fi

