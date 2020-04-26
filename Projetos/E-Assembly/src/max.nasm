; Arquivo: Max.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares 
; Data: 27/03/2017
; Log :
;     - Rafael Corsi portado para Z01
;
; Calcula R2 = max(R0, R1)  (R0,R1,R2 se referem a  RAM[0],RAM[1],RAM[2])
; ou seja, o maior valor que estiver, ou em R0 ou R1 sera copiado para R2
; Estamos considerando número inteiros

; checar se r1 - r0 >0
; se for, ent r2 eh r1
; se n for, ent r2 = r0


leaw $0, %A ;  %A = 0    
movw (%A), %D ; %D = RAM[0]
leaw $2, %A ; %A = 2
movw %D, (%A) ; RAM[%A] = RAM[2] = RAM[0]
leaw $1, %A ; %A = 1
subw (%A), %D, %D ; %D = RAM[1] - RAM[0]
leaw $END, %A ; %A = END
jle ; IF RAM[1] - RAM[0] <0, termina
nop 
leaw $1, %A
movw (%A), %D
leaw %2, %A
movw %D, (%A)
END:
 