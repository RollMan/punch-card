declare tut {
  inout instruction[8];
  output address[8];
  output accumulator[8];
  func_out imem_read;
  func_out dmem_read(address):instruction;
  func_in done_imem_read(instruction);
  func_out dmem_write(address, instruction);
}
