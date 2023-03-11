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


@i
M=0

@R2
M=0

// sum stores the repeated addition of the number
@sum
M=0

(LOOP)

// If i == R1 (the number of times the number needs to be added to itself), break
@R1
D=M
@i
D=D-M
@END
D;JEQ

// If R0 = 0, must break
@R0
D=M
@END
D;JEQ

// If R1 = 0, break
@R1
D=M
@END
D;JEQ

@R0
D=M
@sum
M=M+D
@i
M=M+1

@LOOP
0;JMP

(END)
// If i == 0, RAM[R2] must be 0
@i
D=M
@SETZERO
D;JEQ

@sum
D=M
@R2
M=D

(REPEAT)
@REPEAT
0;JMP

(SETZERO)
@R2
M=0
@REPEAT
0;JMP