#!/bin/bash
sudo rm -f /usr/local/bin/{winsound,srconv,sdif2ad,sndinfo,scsort,scale,scot,pvlook,pvanal,pv_export,pv_import,makecsd,mixer,lpc_export,lpc_import,hetro,lpanal,het_export,het_import,extractor,extract,envext,cvanal,dnoise,cstclsh,cswish,csound5gui,csound,csb64enc,csbeats,cs,atsa}
sudo rm -rf /usr/local/lib64/{csnd.jar,csound,libcsladspa.so,libcsnd.so.5.2,libcsound64.a,libcsound64.so.5.2,libCsoundAC.a,lib_jcsound.so,tclcsound.so}
sudo rm -rf /usr/local/include/csound/
sudo rm -f /usr/lib{,64}/python2.7/site-packages/{csnd.py,_csnd.so,CsoundAC.py,_CsoundAC.so}
sudo rmdir -p /usr/lib64/python2.7/site-packages >/dev/null 2>&1
sudo mkdir -p /usr/lib64
