#!/bin/sh

 
echo
echo " *** Este script deve ser rodado dentro do diretorio /etc/named/master ***"
echo " -------------------------------------------------------------------------"
echo
echo "          ATENCAO: Antes de rodar este script e necessario:"
echo
echo "        1 - atualizar os seriais nos arquivos de configuracao;"
echo "        2 - verificar se a data de validade dos RRs ainda e valida; "
echo
echo "   *** CASO NAO TENHA SEGUIDO ESTES PASSOS, DIGITE Ctrl+C agora... *** "
echo

#sleep 2

###################################################
#ZONE_DIR="/var/named/chroot/var/named/master/zonas"
CHROOT_BASE="/var/named/chroot"
ZONE_BASE="${CHROOT_BASE}/var/named/master"
DIR_DB="${ZONE_BASE}/2.zonas"
DIR_KEYS="${ZONE_BASE}/1.keys"
DIR_SIGNED="${ZONE_BASE}/3.signed"

LOG_FILE="${CHROOT_BASE}/var/log/$(basename $0).log"

OPWD="$PWD"

# data final de validade dos registros Formato: AAAAMMDDHHMMSS
END_DATE="20161231235959"


FUNCTION_SIGN_ALL() {

  cd $DIR_DB
  for ZONE_FNAME in $(ls db.*); do
    ZONE_NAME="$(echo $ZONE_FNAME |awk -F'db.' '{print$2}')";
    DOMAIN=$ZONE_NAME
    if [ "$ZONE_NAME"x == "x" ]; then
      echo "## Domain file db not found for domain [$DOMAIN]." |tee -a ${LOG_FILE}
    else  
      echo -n " # Signing zone [$DOMAIN]... " |tee -a ${LOG_FILE}
      dnssec-signzone -r /dev/random -e $END_DATE -o $ZONE_NAME -K $DIR_KEYS/ -f $DIR_SIGNED/${ZONE_NAME}.signed $ZONE_FNAME >/dev/null 2>&1

      if [ $? -ne 0 ]; then
        echo -n " Errors found. " |tee -a ${LOG_FILE}
      fi
      if [ -f "${ZONE_BASE}/signed/${ZONE_NAME}.signed" ]; then
        echo " SUCCESS [${ZONE_BASE}/signed/${ZONE_NAME}.signed]" |tee -a ${LOG_FILE}
      else
        echo " ERROR. File [${ZONE_BASE}/signed/${ZONE_NAME}.signed] not found" |tee -a ${LOG_FILE}
      fi
    fi

  done

  cd $ODIR
}
FUNCTION_SIGN_ALL;

