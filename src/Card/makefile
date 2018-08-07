all:
	nsl2vl Card.nsl
	nsl2vl test_Card.nsl -verisim2 -target test_Card
	iverilog -o test_Card.vvp test_Card.v Card.v
	vvp test_Card.vvp
