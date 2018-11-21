#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PROJECT="pyplusplus11"
VENV_DIRECTORY=~/virtualenvs/$PROJECT

# Environment variables needed for setuptools, CMake
export PYPLUSPLUS11_HOME=$CURRENT_DIR
export PYPLUSPLUS11_EXTERNAL_LIBS_DIR=$CURRENT_DIR/external_libraries

# Environment variable to execute cpp test suites in python tests
# Accepted values : True or False
export PYPLUSPLUS11_PYTEST_RUN_CPP_TESTS="False"



# Create a virtualenv for $PROJECT and activate it. Any previous venv will be 
# overwritten
#
# Returns nothing.
function pyplusplus11_venv_create() {
  cd $PYPLUSPLUS11_HOME
  if [ -d "$VENV_DIRECTORY" ]; then
    rm -Rf "$VENV_DIRECTORY"
  fi
  virtualenv "$VENV_DIRECTORY"
  source "$VENV_DIRECTORY"/bin/activate
}
alias pypp_venv=pyplusplus11_venv_create


# Actiavte the current virtualenv for $PROJECT
#
# Returns nothing.
function pyplusplus11_venv_activate() {
  cd $PYPLUSPLUS11_HOME
  if [ -d "$VENV_DIRECTORY" ]; then
    source "$VENV_DIRECTORY"/bin/activate
  fi
}
alias pypp_activate=pyplusplus11_venv_activate


# Install the python's package in editable mode.
#
# Returns nothing.
function pyplusplus11_develop() {
  cd $PYPLUSPLUS11_HOME
  python -m pip install -e . --user
  cd -
}
alias pypp_develop=pyplusplus11_develop


# Install the package locally ( = in user folders) - no sudo rights needed
#
# Returns nothing.
function pyplusplus11_local_install() {
  cd $PYPLUSPLUS11_HOME
  python -m pip install --user .
  cd -
}
alias pypp_linstall=pyplusplus11_local_install


# Install the package for all users - sudo rights needed
#
# Returns nothing.
function pyplusplus11_install() {
  cd $PYPLUSPLUS11_HOME
  python -m pip install .
  cd -
}
alias pypp_install=pyplusplus11_install


# Uninstall the python package ( from develop, local or global install )
#
# Returns nothing.
function pyplusplus11_uninstall() {
  python -m pip uninstall $PROJECT
}
alias pypp_uninstall=pyplusplus11_uninstall


# Run the Python test suite
#
# Returns nothing.
function pyplusplus11_test() {
  cd $PYPLUSPLUS11_HOME
  python3 setup.py test
  cd -
}
alias pypp_test=pyplusplus11_test


# Create distribution package with sources as an archive in dist/ folder
# Returns nothing.
function pyplusplus11_source_distribution() {
  cd $PYPLUSPLUS11_HOME
  python setup.py sdit
  cd -
}
alias pypp_sdit=pyplusplus11_source_distribution


# Create a distribution as an egg file in dist/ folder. No sources included
#
# Returns nothing.
function pyplusplus11_dist_no_sources() {
  cd $PYPLUSPLUS11_HOME
  python setup.py egg-info -Db "" sdist bdist-egg -- exclude-source-files
  cd -
}
alias pypp_bdist_nosrc=pyplusplus11_dist_no_sources