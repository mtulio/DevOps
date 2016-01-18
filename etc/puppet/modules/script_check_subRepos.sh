#!/bin/bash

# Check / update / clone sub-repositories

REPOS="./ linux/ ssh/ zabbix/ profiles/ roles/"


## Project home [linux]: 
#> git clone https://github.com/mtulio/puppet-linux.git

## Project home [zabbix]
#> https://github.com/mtulio/puppet-mod-zabbix.git

## Project home [ssh]
#> https//github.com/mtulio/puppet-mod-ssh.git

## Project home [profiles]
#> https://github.com/mtulio/puppet-mod-profiles.git

## Project home [roles]
#> https://github.com/mtulio/puppet-mod-roles.git


function STATUS() {

  for REPO in $REPOS
  do
    OPWD="$PWD"
    cd $REPO
    echo "#######################################################: "
    echo "###>> Checking status of repository [$REPO]: "
    git status  
    cd $OPWD
  done

}

function CLONE() {

  # TODO
  #return 

  for REPO in $REPOS
  do

    if [ -d "$REPO" ]; then
      echo "## Directory [$REPO] already exists. Skipping clone of repository."
      continue
    fi

    # TODO
    echo "#######################################################: "
    echo "###>> Cloning repository [$REPO]: "

    OPWD="$PWD"

    if [ "$REPO" == "linux/" ]; then
      if [ ! -d "$REPO" ]; then
        mkdir linux/ >/dev/null 2>&1
        cd $REPO
        git clone https://github.com/mtulio/puppet-linux.git linux/
      fi
    elif [ "$REPO" == "ssh/" ]; then
        mkdir ssh/ >/dev/null 2>&1
        cd $REPO
        git clone https://github.com/mtulio/puppet-mod-ssh.git ssh/

    elif [ "$REPO" == "zabbix/" ]; then
        mkdir zabbix/ >/dev/null 2>&1
        cd $REPO
        git clone https://github.com/mtulio/puppet-mod-zabbix.git zabbix/

    elif [ "$REPO" == "profiles/" ]; then
        mkdir profiles/ >/dev/null 2>&1
        cd $REPO
        git clone https://github.com/mtulio/puppet-mod-profiles.git profiles/
    
    elif [ "$REPO" == "roles/" ]; then
        mkdir roles/ >/dev/null 2>&1
        cd $REPO
        git clone https://github.com/mtulio/puppet-mod-roles.git roles/

    else 
      echo "#> Repository [$REPO] not found to be cloned."
    fi
 
    cd $OPWD
  done

}

function UPDATE() {

  # TODO
  return


}

function HELP() {
  echo "# Usage: $0 [status|clone|pull]"
  exit 0;
}

MAIN() {

  case $1 in
    "status") STATUS |less;;
    "clone") CLONE ;;
    "pull") UPDATE ;;
    *) HELP;;
  esac
}
MAIN $@
