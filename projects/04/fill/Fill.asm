// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)

// Storing 16384 (base location of the memory map) in address to begin every iteration

@SCREEN
D=A
@address
M=D

@KBD
D=M
@BLACKLOOP

// If the user inputs anything, contents of KBD != 0, -> make the screen black

D;JNE

// If no input, repeatedly make the screen white (not very efficient :()

@WHITELOOP
0;JMP

(BLACKLOOP)

// The logic to iterate over every register as address is incremented

@address
D=M
@SCREEN
D=D-A
@SCREEN
A=A+D

// -1 in 2s complement is all 1s -> black screen

M=-1

// Incrementing the value of address to fill the next register

@address
M=M+1

// If the value stored in address is the same as the final screen index (== KBD), repeat from the start.

@KBD
D=A
@address
D=D-M

// If we haven't arrived at the final memory map location, continue filling the screen.

@BLACKLOOP
D;JNE

@LOOP
0;JMP

(WHITELOOP)

// The exact same logic as used above, but this time for white pixels (M == 0)

@address
D=M
@SCREEN
D=D-A
@SCREEN
A=A+D

M=0

@address
M=M+1

@KBD
D=A
@address
D=D-M

@WHITELOOP
D;JNE

@LOOP
0;JMP