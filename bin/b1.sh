#!/bin/bash

# Executa a ferramenta "b1" de linha de comando,
# usada para (des)compactar arquivos ".b1"

#exec java -jar $HOME/src/b1-pack/b1-pack-tool-0.9.1/b1-pack-tool-0.9.1.jar $@
exec java -jar $HOME/.m2/repository/org/b1/pack/b1-pack-tool/0.9.2-SNAPSHOT/b1-pack-tool-0.9.2-SNAPSHOT.jar $@
