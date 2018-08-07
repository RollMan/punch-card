declare Card {
  input sensors[9];
  output instruction[8];
  func_in send_paper();
  func_out on_instruction(instruction);
}
