#!/bin/bash
GUESSED="unknown"
#echo $version is set on tcsh
#echo $BASH is set on bash
#echo $shell is set to actual shell name in csh or tcsh
#echo $ZSH_NAME is set on zsh
#echo ksh has $PS3 and $PS4 set
#echo  sh only has $PS1


if [ -z ${shell+x} ]; then echo "shell is unset"; else echo "shell is set to '$shell'"; GUESSED=csh; fi
if [ -z ${version+x} ]; then echo "version is unset"; else echo "version is set to '$version'";GUESSED=tcsh; fi
if [ -z ${BASH+x} ]; then echo "BASH is unset"; else echo "BASH is set to '$BASH'";GUESSED=bash; fi
if [ -z ${ZSH_NAME+x} ]; then echo "ZSH_NAME is unset"; else echo "ZSH_NAME is set to '$ZSH_NAME'";GUESSED=zsh; fi

echo $GUESSED
