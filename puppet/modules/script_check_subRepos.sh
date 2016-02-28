#!/bin/bash

# Check / update / clone sub-repositories

REPOS="./ linux/ ssh/ zabbix/ profiles/ roles/ dnssec/ git/ nfs/"


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

## Project home [dnssec]
#> https://github.com/mtulio/puppet-mod-dnssec.git

## [puppet-git] Fork from https://github.com/mxhero/puppet-git
#> https://github.com/mtulio/puppet-git.git

## [puppet-nfs] Fork from https://github.com/cccccccc/puppet-nfs
#> https://github.com/mtulio/puppet-nfs.git

function STATUS() {

  for REPO in $REPOS
  do
    OPWD="$PWD"
    cd $REPO
    echo "#######################################################: "
    echo -n "###>> Checking status of repository [$REPO]: "
    if [ -d .git/ ]; then echo "[OK]"
    else echo "[FAIL: This directory is not a root repository]"; fi
    git status  
    cd $OPWD
  done
  echo "#######################################################: "

}

function CLONE() {

  # TODO
  #return 

  for REPO in $REPOS
  do
    echo "#######################################################: "

    if [ -d "$REPO" ]; then
      echo "## Directory [$REPO] already exists. Skipping clone of repository."
      continue
    fi

    echo "###>> Cloning repository [$REPO]: "

    OPWD="$PWD"
    #if [ -d "$REPO" ]; then
    #  #mkdir $REPO >/dev/null 2>&1
    #  continue
    #fi

    if [ "$REPO" == "linux/" ]; then
      git clone https://github.com/mtulio/puppet-linux.git linux/

    elif [ "$REPO" == "ssh/" ]; then
      git clone https://github.com/mtulio/puppet-mod-ssh.git ssh/

    elif [ "$REPO" == "zabbix/" ]; then
      git clone https://github.com/mtulio/puppet-mod-zabbix.git zabbix/

    elif [ "$REPO" == "profiles/" ]; then
      git clone https://github.com/mtulio/puppet-mod-profiles.git profiles/
    
    elif [ "$REPO" == "roles/" ]; then
      git clone https://github.com/mtulio/puppet-mod-roles.git roles/
    
    elif [ "$REPO" == "dnssec/" ]; then
      git clone https://github.com/mtulio/puppet-mod-dnssec.git dnssec/
    
    elif [ "$REPO" == "git/" ]; then
      git clone https://github.com/mtulio/puppet-git git/
    
    elif [ "$REPO" == "nfs/" ]; then
      git clone https://github.com/mtulio/puppet-nfs nfs/

    else 
      echo "#> Repository [$REPO] not found to be cloned."
    fi
 
    cd $OPWD
  done

}

function UPDATE() {

  # TODO
  echo "# Not implemented... Returning.."
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
