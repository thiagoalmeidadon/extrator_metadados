#!/bin/bash
# Thiago Almeida
# thiagodons@gmail.com

site=$1
ext=$2

main(){
    echo "Fazendo a busca de $ext para o endereço $site"
    mkdir resultados
    busca="https://www.google.com/search?q=site:$site+ext:$ext"
    lynx --dump $busca | grep "$ext" | cut -d "=" -f 2 | egrep -v "site|google" | cut -d "&" -f 1 >> resultados/busca
    analisador
}

analisador() {
    for url in $(cat resultados/busca);
    do 
        cd resultados;
        wget -q $url;
        cd ..;
    done
    echo "Analisando metadados"
    echo " "
    exiftool resultados/*.$ext
    echo " "
    echo "Excluindo arquivos"
    echo " "
    limpando

}

limpando(){
    rm -rf resultados
}

if [ "$1" == "" ] || [ "$2" == "" ] ; then
    echo "Forma de uso: ./extrator.sh www.site.com pdf"
else
    main
fi

