#!/bin/bash

function upsearch () {

  if [[ "$PWD" == "/" ]] ;
  then
    echo No venv found !
    return
  else
    if [[ -f "$PWD/venv/bin/activate" ]] ;
    then
      echo Activating venv.
      . venv/bin/activate
    else
      cd ..
      upsearch
    fi
  fi
}

upsearch