#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export PROJECT="pyplusplus11"

export PYPLUSPLUS11_HOME=$CURRENT_DIR

export PYPLUSPLUS11_EXTERNAL_LIBS_DIR=$CURRENT_DIR/external_libraries

export PYPLUSPLUS11_PYTEST_RUN_CPP_TESTS="True"


VENV_DIRECTORY=~/virtualenvs/$PROJECT

function pyplusplus11_venv_create() {
  cd $PYPLUSPLUS11_HOME
  if [ -d "$VENV_DIRECTORY" ]; then
    rm -Rf "$VENV_DIRECTORY"
  fi
  virtualenv "$VENV_DIRECTORY"
  source "$VENV_DIRECTORY"/bin/activate
}
alias pypp_venv=pyplusplus11_venv_create

function pyplusplus11_venv_activate() {
  cd $PYPLUSPLUS11_HOME
  if [ -d "$VENV_DIRECTORY" ]; then
    source "$VENV_DIRECTORY"/bin/activate
  fi
}
alias pypp_activate=pyplusplus11_venv_activate

function pyplusplus11_venv_deactivate() {
  deactivate
}
alias pypp_venvoff=pyplusplus11_venv_deactivate


function pyplusplus11_develop() {
  cd $PYPLUSPLUS11_HOME
  python -m pip install -e . --user
  cd -
}
alias pypp_develop=pyplusplus11_develop


function pyplusplus11_local_install() {
  cd $PYPLUSPLUS11_HOME
  python -m pip install --user .
  cd -
}
alias pypp_linstall=pyplusplus11_local_install


function pyplusplus11_install() {
  cd $PYPLUSPLUS11_HOME
  python -m pip install .
  cd -
}
alias pypp_install=pyplusplus11_install


function pyplusplus11_uninstall() {
  python -m pip uninstall $PROJECT
}
alias pypp_uninstall=pyplusplus11_uninstall

function pyplusplus11_test() {
  cd $PYPLUSPLUS11_HOME
  python3 setup.py test
  cd -
}
alias pypp_test=pyplusplus11_test

