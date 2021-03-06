#!/bin/bash

# --------------------- #
#         Settings	    #
# --------------------- #

# --------------------- #
#	        Funcs		      #
# --------------------- #

# --- path ---

# $1 - string - github-git address
function getRepoDirGithub
{
	echo `expr "$1" : '^https:\/\/github\.com\/.[a-z0-9]*\/\(.[a-zA-Z0-9_-]*\)\.git$'`
}

# $1 - string - project.coop-svn address
function getRepoDirProjectCoopSVN
{
  echo `expr "$1" : '^https:\/\/svn\.project\.coop\/svn\/\(.[a-zA-Z0-9_-]*\)$'`
}

# $1 - string|integer - repository link type ( 1 - github | 2 - project.coop-svn )
# $2 - string - address
function getRepoDir
{

	case "$1" in
    "github" | 1) #github
    	dirName=$(getRepoDirGithub $2)
    ;;
    "projectcoop" | 2) #project.coop-svn
    	dirName=$(getRepoDirProjectCoopSVN $2)
    ;;
  esac

	echo $dirName

}

# --------------------- #
#	        main          #
# --------------------- #

attrs()
{
  while [[ $# > 0 ]]
  do
    key="$1"
    case $key in
      "-h"|"--help")
				cat path.md
				exit
			;;
			-t|--type)
      	type="$2"
      	shift # past argument=value
      ;;
      -u|--url)
      	url="$2"
      	shift # past argument=value
      ;;
      *)
        # unknown option
      ;;
    esac
    shift # past argument or value
  done
}

run()
{

  #return
	echo $(getRepoDir $type $url)

}

attrs $@
run
