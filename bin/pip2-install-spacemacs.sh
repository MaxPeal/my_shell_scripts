#!/bin/sh
export PYENV_VERSION="2.7.13"
pyenv global "$PYENV_VERSION" >/dev/null 2>&1 || exit 1
exec pip2 install -U tox nose pytest pylink pep8 flake8 autoflake autopep8 bpython ipython[notebook] jedi json-rpc service_factory hy virtualenvwrapper yapf isort
