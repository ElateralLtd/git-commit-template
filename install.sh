#!/bin/bash
# Description
# Elateral git commit message installer

# Exit on any failed command
set -e

###
### Dependency checks
###
checkDependencies() {
  for CMD in $@
  do
    command -v $CMD >/dev/null 2>&1 || { echo >&2 "$CMD required but not installed.  Aborting."; exit 1; }
  done
}

# Check if deps are present on system, if not fail build
checkDependencies git

VERSION=1.1.0
INSTALL_DIR=~/.elateral/git-commit-template
OLD_INSTALL_DIR=~/elateral/git-commit-template
echo "Installing v${VERSION} 🎉"

if [ -d ${OLD_INSTALL_DIR} ];
then
  echo "Removing old install directory ❗️"
  rm -rf ${OLD_INSTALL_DIR}
fi

if [ -d ${INSTALL_DIR} ];
then
  echo "Removing existing directory ❗️"
  rm -rf ${INSTALL_DIR}
  echo "Creating directory 📂"
  mkdir -p ${INSTALL_DIR}
else
  echo "Creating directory 📂"
  mkdir -p ${INSTALL_DIR}
fi

git clone https://github.com/ElateralLtd/git-commit-template.git ${INSTALL_DIR}

echo "Updating global configuration ⚙️"
git config --global commit.template ${INSTALL_DIR}/.git-commit-message-template.txt
git config --global commit.cleanup strip

echo "Successfully installed 👍"
