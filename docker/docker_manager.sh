#!/bin/bash

#
# Script to manage docker - docker main commands
#
# Created at 05 May 2016
# Author: Marco Tulio R Braga
#

WORKDIR="$(dirname $0)"
LIB_FUNCTIONS="${WORKDIR}/libs/functions"

BIN_DK="$(which docker)"

###
function FC_HELP() {
  case $1 in
    '1') echo " # Docker package was not found, install it! [$BIN_DK]"; exit 1;;
    '2') echo " # Libs not found! [$LIB_FUNCTIONS]"; exit 2;;
    '3') echo " # Libs does not have execute permission! [$LIB_FUNCTIONS]"; exit 3;;
    *) echo "Option not found"; exit 99;;
  esac
}

# Check dependencies
## Docker Bin
if [ "$BIN_DK"x == "x" ]; then
  FC_HELP 1
else
  test -x $BIN_DK || FC_HELP 1
fi

## Libs
test ! -f ${LIB_FUNCTIONS} && FC_HELP 2
if [ -x $LIB_FUNCTIONS ];then
  source $LIB_FUNCTIONS
else
  FC_HELP 3
fi

# MAIN
case $1 in
  "status"|"stat") FC_LIB_STATUS;;
  *) FC_HELP;;
esac

