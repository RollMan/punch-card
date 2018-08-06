sim:
	nsl2vl ../common/PWM.nsl -I../common
	nsl2vl MD.nsl
	nsl2vl test_MD.nsl -verisim2 -target test_MD
	iverilog -o test_MD.vvp test_MD.v PWM.v MD.v
clean:
	rm -rf *.v *.vvp
