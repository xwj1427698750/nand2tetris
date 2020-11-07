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
@SCREEN
D=A
@i
M=D   //M[i] = SCREEN
@j
M=D   //M[j] = SCREEN

@KBD
D=M
@CLEARLOOP
D;JEQ      //M[KBD]==0 跳转到CLEARLOOP 操作

(FILLLOOP) //填充操作
@i
D=M        //D = M[i]
@KBD
D=D-A      //D = M[i] - KBD
@FILLEND
D;JGE      //if(M[i] - KBD) >=0 : go to FILLEND
@i
A=M        //A = M[i]
M=-1       //M[A]=-1, 填充屏幕
@i
M=M+1      //M[i]=M[i]+1
@FILLLOOP
0;JMP
(FILLEND)
@LOOP
0;JMP

(CLEARLOOP) //清除操作
@j
D=M        //D = M[j]
@KBD
D=D-A      //D = M[j] - KBD
@CLEAREND
D;JGE      //if(M[j] - KBD) >=0 : go to CLEAREND
@j
A=M        //A = M[j]
M=0        //M[A]=0, 清除屏幕
@j
M=M+1      //M[j]=M[j]+1
@CLEARLOOP
0;JMP
(CLEAREND)
@LOOP
0;JMP




