declare DE10lite {

  // photo-reflector input
  input ARDUINO_IO_0, ARDUINO_IO_1, ARDUINO_IO_2, ARDUINO_IO_3, ARDUINO_IO_4, ARDUINO_IO_5, ARDUINO_IO_6, ARDUINO_IO_7, ARDUINO_IO_8;

  // activation_key
  // input KEY1;

  // instruction_sw
  // input SW[10];

  // motor control
  output GPIO0, GPIO1, GPIO2;

  // accumulator output
  output HEX0[8], HEX1[8];

  // PC debug output;
  output HEX2[8], HEX3[8];

  // photo-reflector debugging
  output LEDR[10];
}
