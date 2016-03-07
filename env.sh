#!/bin/bash
su - vagrant -c "xauth list" | xargs xauth add
alias 'ls=ls --color=auto'
alias 'll=ls -l'
