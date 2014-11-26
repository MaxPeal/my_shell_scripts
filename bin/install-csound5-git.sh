#!/bin/bash


mkdir -p ~/dev/csound
cd ~/dev/csound


if [ -d csound5-git/.git ]; then
	cd csound5-git
	git pull || exit 1
else
	rm -rf csound5-git
	git clone git://git.code.sf.net/p/csound/csound5-git || exit 1
	cd csound5-git
fi
sudo cp -f ../custom.py .
#sudo scons buildCsound5GUI=1 buildCsoundAC=1 buildCSEditor=1 buildInterfaces=1 buildJavaWrapper=1 buildLuaOpcodes=1 buildLuaWrapper=1 buildNewParser=1 buildPythonOpcodes=1 buildPythonWrapper=1 buildRelease=1 buildTclcsound=1 buildUtilities=1 buildVirtual=1 buildWinsound=1 buildBeats=1 generateTags=1 Lib64=1 useALSA=1 useCoreAudio=1 useDouble=1 useFLTK=1 useGettext=1 useIpMIDI=1 useGprof=1 usePortAudio=1 usePortMIDI=1 useOSC=1 Word64=1 pythonVersion=2.7 buildMultiCore=1 install=1 dynamicCsoundLibrary=1 /usr/local
sudo scons buildCsound5GUI=1 buildCsoundAC=1 buildCSEditor=1 buildInterfaces=1 buildJavaWrapper=1 buildLuaOpcodes=1 buildLuaWrapper=1 buildNewParser=1 buildPythonOpcodes=1 buildPythonWrapper=1 buildRelease=1 buildTclcsound=1 buildUtilities=1 buildVirtual=1 buildWinsound=1 buildBeats=1 generateTags=1 Lib64=1 useALSA=1 useCoreAudio=1 useDouble=1 useFLTK=1 useGettext=1 useIpMIDI=1 useGprof=1 usePortAudio=1 usePortMIDI=1 useOSC=1 Word64=1 pythonVersion=2.7 buildMultiCore=1 install=1 /usr/local
cd ..


if [ -d manual-git/.git ]; then
	cd manual-git
	git pull || exit 1
else
	rm -rf manual-git
	git clone git://git.code.sf.net/p/csound/manual-git || exit 1
	cd manual-git
fi
