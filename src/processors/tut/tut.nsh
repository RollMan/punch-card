declare tut {
  inout data[8];
  output address[8];
  func_out mread(address): data;
  func_out mwrite(address, data);
}
