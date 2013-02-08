#!/bin/bash

#biblioteca com as funções
# help - creditos - atualiza - configurações 


#Help, i need somebody, HELP!
helpi() {
        zenity \
        --info \
        --title 'Help' \
        --text='                                       \n
                Envie um e-mail com suas duvidas e sugestões \n
                para: "riso@comp.eng.br" e reponderei o   \n
                mais rápido possível.'
}

#Pessoas que fizeram acontecer
creditos() {

        zenity \
        --info \
        --no-wrap \
	--title 'Creditos' \
        --text=' \n
	CENTRO FEDERAL DE EDUCAÇAO TECNOLOGICA \n
		Engenharia da Computaçao \n
						
		Cristiano Goulart Lopes Dias \n
		Vinicius Tinti de Paula Oliveira \n
		Germano Teixeira de Miranda \n
		Gabriel de Souza Brandao \n
		Marcio J. Menezes Jr. \n
		Gabriel Machado de Castro Fonseca \n
		André Luiz Silveira Herculano \n
		
		Atualizado por: \n
			Agnes Oliveira \n
			Gabriel Dutra Dias \n
			Marcela Leticia C. Januario \n
			Thais Diniz Braz \n
							\n
		Agradecimentos: \n
			Pedro Andre \n
			Por fazer esse projeto acontecer \n
							\n
			www.decom.cefetmg.br \n'
}

#Atualiza R.I.S.O.
atualiza() {
(
	versaoatual=0
	log "Verificando atualizações"
	echo "#Verificando atualizações"
	rm -rf tmp
	mkdir tmp
	cd tmp
	sleep 1
	git init
	git clone -b attcontrol http://github.com/agnesoliveira/RISO-RISOS &> /dev/null
	echo "10"
	sleep 1
	cd RISO
	sleep 1
	source att
	if [ $versaoriso -gt $versaoatual ]
then
		#Menssagem de atualizado com sucesso.
        	#zenity --title="Atenção" \
       	       # --info --text="\n  Atualização disponivel.\n" \
		source atualizar
		exit
	else
		echo "#Versão já é a mais recente"

		log "Esta já é a versão mais nova."
		echo "99"
		sleep 2
		echo "#Iniciando..."
		
	fi

) | zenity --progress --width=400 --text="Atualização RISO" --auto-close
		

}

#Define configurações do riso
configuracoes() {

    zenity --title="AVISO" --question --text="Alterar esse arquivo é potencialmente perigoso, se não souber o 
que esta fazendo pare agora.\nDeseja continuar?"

    if [ "$?" -eq "0" ]; then
		log "Iniciando configuração manual do arquivo de configuração."
		gedit $riso_conf
		log "Finalizada a edição manual do arquivo de configuração."		
	fi

}
