declare tut {
  input instruction[8];
  output data[8];
  output address[8];
  output accumulator[8];
  func_out mread;
  func_in done_mread(instruction);
  func_out mwrite(address, data);
}
