; Arquivo: stringLength.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi 
; Data: 28/03/2018
;
; Assuma que uma string é um conjunto de caracteres terminado
; em NULL (0).
; 
; Supondo que temos uma string que começa no endereço 8 da RAM.
; Calcule o seu tamanho e salve o resultado na RAM[0].
;
; Os caracteres estão formatados em ASCII
; http://sticksandstones.kstrom.com/appen.html
; 
; Exemplo:
;
;   Convertido para ASCII
;             |
;             v
;  RAM[8]  = `o`
;  RAM[9]  = `i`
;  RAM[10] = ` `
;  RAM[11] = `b`
;  RAM[12] =  l`
;  RAM[13] = `z`
;  RAM[14] = `?`
;  RAM[15] = NULL = 0x0000


leaw $8, %A ; A=8
movw %A, %D ; D=A=8
leaw $1, %A ; A=1
movw %D, (%A) ;RAM[1]=D=8


leaw $0, %A ; A=0
movw $0,(%A) ; RAM[0]=0


LOOP:
leaw $0, %A ; A=0
movw (%A), %D ; D=RAM[0]
addw $1, %D, (%A)  ;RAM[0]=RAM[0]+1


leaw $1, %A ;A=1
movw (%A), %D ; D=RAM[1]
addw $1, %D, (%A) ; RAM[1]=RAM[1]+1
movw (%A), %D ; D=RAM[1]


movw %D,%A ; A=D=RAM[1]
movw (%A), %D ; D=RAM[A]

leaw $LOOP, %A ; if A!=0 repeat
jne %D
nop


leaw $8, %A ; A=8
movw (%A), %D ;D=RAM[8]
leaw $TCHAU, %A 
jne %D ; if D!= end
nop

leaw $0, %A 
movw $0, (%A) ; RAM[0]=0

TCHAU: