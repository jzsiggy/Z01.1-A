; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Copia o valor de RAM[1] para RAM[0] deixando o valor sempre positivo.


; if ram[1] >= 0:
;   ram[0] = ram[1]
; else:
; ram[0] = ram[1] negado


leaw $1, %A
movw (%A), %D
leaw $0, %A
movw %D, (%A)
leaw $END, %A
jge
nop
negw %D
leaw $0, %A
movw %D, (%A)
END:

 