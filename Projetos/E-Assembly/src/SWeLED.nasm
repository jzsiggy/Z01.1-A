; Arquivo: SWeLED.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Faça os LEDs exibirem 
; LED = ON ON ON ON ON !SW3 !SW2 !SW1 0 

; 111110000

; Mesma questão da prova
; Se SW < 000001111, somar com LED


leaw $496,%A
movw %A, %D
leaw $0, %A
movw %D, (%A)
leaw $21185, %A
movw (%A), %D
notw %D
leaw $14, %A
andw %A, %D, %D
leaw $0, %A
movw (%A), %A
orw %A, %D, %D
leaw $21184, %A
movw %D, (%A)