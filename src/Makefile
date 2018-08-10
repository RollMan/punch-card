################################################################################
# Makefile : sof file generation using Quartus II
# Usage:
#		make compile for synthesis all files
#       make download for download .sof file to FPGA board
################################################################################
# 2017-06-06    Modified for DE10-Lite environment
################################################################################

ifndef SRCDIR
SRCDIR	= .
endif

VPATH		= $(SRCDIR)
WORKDIR		= synth
DESIGN		= DE10lite
SIM_TARGET	= sim_DE10lite
NSL2VL    	= nsl2vl
NSLFLAGS  	= -O -neg_res -I$(SRCDIR) -I$(SRCDIR)/common -I$(SRCDIR)/MD -I$(SRCDIR)/processors/tut -I$(SRCDIR)/HEX -I$(SRCDIR)/Card -I$(SRCDIR)/NegEdge
MKPROJ		= $(SRCDIR)/mkproj-$(DESIGN).tcl

IVERILOG	= iverilog
VVP			= vvp

Q2_PATH = /opt/intelFPGA_lite/17.0/quartus/bin
Q2SH		= $(Q2_PATH)/quartus_sh
Q2PGM		= $(Q2_PATH)/quartus_pgm
CABLE		= "USB-Blaster [1-2]"
PMODE		= JTAG

SRCS		= $(DESIGN).nsl ./common/PWM.nsl ./MD/MD.nsl ./processors/tut/tut.nsl ./HEX/HEX.nsl Card/Card.nsl ./NegEdge/NegEdge.nsl
#SRCS		= $(DESIGN).nsl
VFILES 		= $(SRCS:%.nsl=%.v)
LIBS		=
RESULT		= result.txt

########

all:
	@if [ ! -d $(WORKDIR) ]; then \
		echo mkdir $(WORKDIR); \
		mkdir $(WORKDIR); \
	fi
	( cd $(WORKDIR); make -f ../Makefile SRCDIR=.. compile )

sim:
	@if [ ! -d $(WORKDIR) ]; then \
		echo mkdir $(WORKDIR); \
		mkdir $(WORKDIR); \
	fi
	( cd $(WORKDIR); make -f ../Makefile SRCDIR=.. simulation )

########

.SUFFIXES: .v .nsl

$(SIM_TARGET).v: $(SIM_TARGET).nsl
	$(NSL2VL) $(NSLFLAGS) -verisim2 $< -target $(SIM_TARGET) -o $(notdir $@)

.nsl.v:
	$(NSL2VL) $(NSLFLAGS) $< -o $(notdir $@)
	if [ ! -s $(notdir $@) ]; then\
		exit 1;\
	fi

$(DESIGN).qsf: $(VFILES) $(LIBS)
	$(Q2SH) -t $(MKPROJ) -project $(DESIGN) $^

$(DESIGN).sof: $(DESIGN).qsf $(MIFS)
	$(Q2SH) --flow compile $(DESIGN)

########

compile: $(DESIGN).sof
#	@echo "**** $(DESIGN).fit.summary" | tee -a $(RESULT)
#	@cat $(DESIGN).fit.summary | tee -a $(RESULT)
#	@echo "**** $(DESIGN).tan.rpt" | tee -a $(RESULT)
#	@grep "Info: Fmax" $(DESIGN).tan.rpt | tee -a $(RESULT)

download: config-n

config: all
	$(Q2PGM) -c $(CABLE) -m $(PMODE) -o "p;$(WORKDIR)/$(DESIGN).sof"
config-n: # without re-compile
	$(Q2PGM) -c $(CABLE) -m $(PMODE) -o "p;$(WORKDIR)/$(DESIGN).sof"

clean:
	rm -rf - $(WORKDIR)

########

$(DESIGN).v	: $(DESIGN).nsl

simulation: $(SIM_TARGET).vvp
	vvp $(notdir $^)

$(SIM_TARGET).vvp : $(VFILES) $(SIM_TARGET).v
	$(IVERILOG) -o $@ $(notdir $^)
