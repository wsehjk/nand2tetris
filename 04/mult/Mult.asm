// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
@R1
  D=M
@multi
  M=D  // multi = R1
@product
  M=0
@R0
  D=M
@n
  M=D   // n = R0
(LOOP)
  @n
    D=M
  @POSITIVE
    D;JGT  // n > 0
  // n==0
  @product
    D=M
  @R2
    M=D  // R2 = product = R1*R0
  @END
    0;JMP  // goto end
  (POSITIVE) // product = product + multi; n = n - 1
    @multi
      D=M
    @product
      M=D+M  // product = product + multi
    @n
      M=M-1 // n = n -1
    @LOOP
      0;JMP // goto loop
(END)
  @END
    0;JMP
