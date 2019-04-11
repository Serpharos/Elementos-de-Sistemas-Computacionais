// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

     @2 //RAM[2]
     M=0 //Colocando 0 no resultado final, RAM[2] = R2

//Verificando se o 1o num é 0:
    @0
    D=M //Coloca em D o valor de R0 
    @FIM
    D;JEQ //Obviamente, se R0 for 0, R2 será 0 e o processo acaba.

//Verificando se o 2o num. é 0:
    @1
    D=M
    @FIM
    D;JEQ	//Se R1 for 0, R2 será 0 e o processo acaba.

//Armazenando o valor de R0 no endereço 3
    @0
    D=M	// Põe em D o valor de R0
    @3	
    M=D	//Põe D, que é R0, em RAM[3], que será quantas vezes o processo será feito
        //Ou seja, quantas vezes R1 será somado com ele mesmo

//Loop de soma até que RAM[3] seja 0, ou seja, até que o numero tenha sido somado com ele mesmo R0 vezes

(LOOP)
    @1	
    D=M	//D tem o valor de R1

    @2	
    M=D+M //Soma o valor de R1 + o valor de R2

    @3	
    M=M-1 //Diminui o valor de RAM[3] (que nada mais é do que a qtd de vezes que o num. será somado com ele mesmo)
         //até que chegue 0

    D=M	//D = RAM[3]
    @LOOP	//
    D;JGT	//Volta pro LOOP se D, que é RAM[3], for>0

(FIM)
    @FIM
    //@2 Melhor colocar no início pois evita que o loop final fique colocando 0 em RAM[2]
    //M=0
    0;JMP //LOOP interminável