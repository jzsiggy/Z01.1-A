; Arquivo: SWeLED2.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
;
; Faça os LEDs exibirem 
; LED = SW[8] !SW[7] OFF ON ON RAM[5][3] ON SW[0] OFF
;        sw    !sw    0   1   1   ram     1   sw   0
;
;       000110100 = 52
;
;                                ^            ^
;                                | TRUQUE!    | TRUQUE!

leaw $52,%A
movw %A, %D
leaw $0, %A
movw %D, (%A)
leaw $21185, %A
movw (%A), %D
notw %D
leaw $128, %A
andw %A, %D, %D
leaw $0, %A
movw (%A), %A
orw %A, %D, %D
leaw $21184, %A
movw %D, (%A) ; salva no led
; 0 !SW 0 1 1 0 1 0 0 

leaw $21185, %A
movw (%A), %D
leaw $256, %A
andw %A, %D, %D
leaw $21184, %A 
movw (%A), %A
orw %A, %D, %D
leaw $21184, %A
movw %D, (%A) ; salva no led
; SW !SW 0 1 1 0 1 0 0 

leaw $21185, %A
movw (%A), %D
leaw $1, %A
andw %A, %D, %D
movw %D, %A
addw %A, %D, %D
leaw $21184, %A 
movw (%A), %A
orw %A, %D, %D
leaw $21184, %A
movw %D, (%A) ; salva no led
; SW !SW 0 1 1 0 1 SW[0] 0 

leaw $5, %A
movw (%A), %D
leaw $8, %A
andw %A, %D, %D
leaw $21184, %A 
movw (%A), %A
orw %A, %D, %D
leaw $21184, %A
movw %D, (%A) ; salva no led
; SW !SW 0 1 1 RAM[5][3] 1 SW[0] 0 





