#!/bin/bash
cd /home/aluno/.EducaTux/
ps axw > ps.axw
teste="`grep 'ubuntu\-educatux\-live\.iso' ps.axw`"
[ -z "${teste}" ] && ./wget-dvd.sh
