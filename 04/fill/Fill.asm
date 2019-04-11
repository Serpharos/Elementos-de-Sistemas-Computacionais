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

@8192   //Numero de endere�os
        D=A     // D recebe 8192
        @count  // A fica com valor de @count, que � 16

        M=D     // coloca 8192 no endere�o 16
(LOOP)
        @temp // a fica com valor de temp, que � 17
        M=0     // ram[17]= temp = 0
(VERIFICACAO)
        @KBD //espa�o na memoria dedicado � leitura do teclado, que � o end. 24576
        D=M 
        @PERMOUADDBRANCO //permanece (ou adiciona) branco na tela
        D;JEQ   // d� um jump pra parte de preencher com branco se KBD for 0 (Ou seja nao leu nada do teclado), caso contrario
        //vai pro label responsavel pela parte de preencher com preto
(PREENPRETO)
        @temp
        D=M
        @SCREEN
        A=A+D   
        M=-1    // Preenche o campo com -1, significando preto
        @PTFINAL
        0;JMP   // jump pra parte final (aqui j� passou a parte de preenchimento, basta apenas agora avan�ar a coluna e repetir o processo)
(PERMOUADDBRANCO)
        @temp
        D=M
        @SCREEN
        A=A+D   
        M=0     // Preenche o campo com 0, significando branco
(PTFINAL)   
        @temp
        D=M+1  
        M=M+1
        //D=D+1 
        //M=M+1 
        //Pularia 1 casa
        //Com esses comandos foi aumentado o �ndice e agora passar� a preencher (ou n�o) na pr�xima coluna
        @count
        D=D-M
        @LOOP
        D;JEQ   
        @VERIFICACAO
        0;JMP   //Pula pra parte de verifica��o, repetindo o processo