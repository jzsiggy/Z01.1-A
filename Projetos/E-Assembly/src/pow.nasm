; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos


leaw $0, %A
movw %A, %D
leaw $4, %A
movw %D, (%A)

LOOP:
leaw $0, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
leaw $0, %A
movw %D, (%A)
;até aqui tá certo

leaw $4, %A
movw (%A), %D
incw %D
movw %D, (%A)
; até aqui tá certo

movw (%A), %D
leaw $1, %A
subw (%A), %D, %D
; até aqui tá certo

leaw $END, %A
je %D
nop

leaw $LOOP, %A
jmp
nop

END: