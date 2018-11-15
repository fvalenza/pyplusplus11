#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export PYPLUSPLUS11_HOME=$CURRENT_DIR

export PYPLUSPLUS11_EXTERNAL_LIBS_DIR=$CURRENT_DIR/external_libraries

function pyplusplus11_local_install() {
  python -m pip install --user .
}
alias pypplinstall=pyplusplus11_local_install

function pyplusplus11_uninstall() {
  python -m pip uninstall pyplusplus11
}