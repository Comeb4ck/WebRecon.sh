#!/bin/bash
################################################################################
# Titulo    : WebRecon                                                         #
# Versao    : 1.2                                                              #
# Data      : 29/01/2021                                                       #
# Tested on : Linux                                                            #
################################################################################

# ==============================================================================
# Constantes
# ==============================================================================

# Constantes para facilitar a utilização das cores.
	RED='\033[31;1m'
	GREEN='\033[32;1m'
	BLUE='\033[34;1m'
	YELLOW='\033[33;1m'
	RED_BLINK='\033[31;5;1m'
	END='\033[m'
	YELLOW_NEG='\033[33;04;1m'
# ------------------------------------------------------------------------------
#                                   CODIGO                                     #
#-------------------------------------------------------------------------------
clear
if [ "$1" == "" ]
then
	echo -e "${RED_BLINK}------------------------------------------------------------------------------${END}"
	echo -e "${RED}|-                             ${YELLOW}Comeb4ck TOOLS                              ${RED} -|${END}"
	echo -e "${RED}|-             ${YELLOW} Modo de uso: ./webrecon.sh http://site.com                 ${RED} -|${END}"
	echo -e "${RED_BLINK}------------------------------------------------------------------------------${END}"
else
	echo -e "${RED}Lendo sua wordlist...${END}"
	sleep 1
	echo -e "${RED} Pesquisando diretorios...${END}"
	for palavra in $(cat data/webrecon/lista.txt)
do
	resposta=$(curl -s -H "User-Agent: Comeb4ckTool" -o /dev/null -w "%{http_code}" $1/$palavra/)
	case $resposta in
"200")
	echo -e "${RED_BLINK}------------------------------------------------------------------------------${END}"
        echo -e "${YELLOW}Diretorio ${YELLOW_NEG}$1/$palavra/${END} ${YELLOW}Existe${END}"
	echo -e "${RED_BLINK}------------------------------------------------------------------------------${END}"
;;
esac
done
fi
