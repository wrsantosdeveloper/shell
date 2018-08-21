#!/bin/bash

converter_imagem(){
	
	local caminho_imagem=$1
	local imagem_sem_extensao=$(ls $caminho_imagem | awk -F. ' { print $1  } ')

	convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
}

varrer_diretorio(){

	cd $1

	for arquivo in *
	do
		local caminho_arquivo=$(find ~/Projetos/imagens-novos-livros -name $arquivo)
        
		if [ -d $caminho_arquivo ]
    		then
			varrer_diretorio $caminho_arquivo
    		else
			converter_imagem $caminho_arquivo
		fi
	done
}

#Main
varrer_diretorio ~/Projetos/imagens-novos-livros 2> ~/Projetos/Scripts/log.txt

if [ $? -eq 0  ]
then
    echo "Processo de conversão efetuado com sucesso"
else
    echo "Falha no Processo. Por favor verificar arquivo de log"
fi    

