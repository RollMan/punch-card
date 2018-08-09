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
NSL2VL    	= nsl2vl
NSLFLAGS  	= -O -neg_res -I$(SRCDIR) -I$(SRCDIR)/../common/
MKPROJ		= $(SRCDIR)/mkproj-$(DESIGN).tcl

Q2_PATH = /opt/intelFPGA_lite/17.0/quartus/bin
Q2SH		= $(Q2_PATH)/quartus_sh
Q2PGM		= $(Q2_PATH)/quartus_pgm
CABLE		= "USB-Blaster [1-1]"
PMODE		= JTAG

SRCS		= $(DESIGN).nsl $(SRCDIR)/../common/PWM.nsl $(SRCDIR)/MD.nsl
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

########

.SUFFIXES: .v .nsl

.nsl.v:
	$(NSL2VL) $(NSLFLAGS) $< -o $(notdir $@)

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

