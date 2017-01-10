sudo aptitude install '?and( ?or( ?architecture(amd64), ?architecture(all) ), ?and( ?name(^postgresql.*9\.5.*$), ?not(postgresql-9.5-python3-multicorn) ) )'
sudo aptitude install '?and( ?or( ?architecture(amd64), ?architecture(all) ), ?and( ?or( ?name(^llvm.*3\.8.*$), ?or( ?name(^clang.*3\.8.*$), ?name(^libclang.*3\.8.*$) ) ), ?not(^.*-dbg$) ) )'
sudo aptitude install '( ~ramd64 | ~rall ) ( ( ^python.*pyqt.*$ | ^python.*qsci.*$ | ^python.*qtsql.*$ | ^python.*sip.*$ ) aptitude.*-dbg$ )'
