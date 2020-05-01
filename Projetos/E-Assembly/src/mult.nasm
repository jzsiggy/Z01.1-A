; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

leaw $0, %A
movw (%A), %D
leaw $END, %A
je
nop
leaw $1, %A
movw (%A), %D
leaw $END, %A
je 
nop ; checa se RAM[0] ou RAM[1] são iguais a zero

LOOP:
leaw $0, %A
movw (%A), %D
leaw $3, %A
addw %D, (%A), %D
movw %D, (%A)
leaw $1, %A
movw (%A), %D
subw %D, %A, %D
movw %D, (%A)
leaw $LOOP, %A
jg
nop

END: