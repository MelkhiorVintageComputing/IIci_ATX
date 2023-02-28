#!/bin/bash

GERBER_FILES="
IIci_ATX-B_Cu.gbr
IIci_ATX-B_Mask.gbr
IIci_ATX-B_Paste.gbr
IIci_ATX-B_SilkS.gbr
IIci_ATX-Edge_Cuts.gbr
IIci_ATX-F_Cu.gbr
IIci_ATX-F_Mask.gbr
IIci_ATX-F_Paste.gbr
IIci_ATX-F_SilkS.gbr
IIci_ATX-In1_Cu.gbr
IIci_ATX-In2_Cu.gbr"

POS_FILES="IIci_ATX-top.pos"
# IIci_ATX-bottom.pos

DRL_FILES="IIci_ATX-NPTH.drl IIci_ATX-PTH.drl IIci_ATX-PTH-drl_map.ps IIci_ATX-NPTH-drl_map.ps"

FILES="${GERBER_FILES} ${POS_FILES} ${DRL_FILES} top.pdf bottom.pdf IIci_ATX.d356 IIci_ATX.csv"
# bottom.pdf

echo $FILES

KICAD_PCB=IIci_ATX.kicad_pcb

ABORT=no
for F in $FILES; do 
    if test \! -f $F || test $KICAD_PCB -nt $F; then
	echo "Regenerate file $F"
	ABORT=yes
    fi
done

if test $ABORT == "yes"; then
    exit -1;
fi

zip IIci_ATX.zip $FILES top.jpg bottom.jpg
