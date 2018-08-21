#!bin/bash

converter() {
cd ~/Projetos/imagens-livros

if [ ! -d png ]
then
    mkdir png
fi

for imagem in *.jpg
do
    imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
    convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done
}

converter 2> log.txt

if [ $? -eq 0  ]
then
    echo "Convesão realizada com sucesso"
else
    echo "Houve uma falha no processo de conversão"	
fi

