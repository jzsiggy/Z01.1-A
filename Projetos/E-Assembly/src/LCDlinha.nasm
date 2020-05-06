; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe uma linha no LCD

leaw $18789,%A
movw $-1, (%A)
leaw $18790,%A
movw $-1, (%A)
leaw $18791,%A
movw $-1, (%A)
leaw $18792,%A
movw $-1, (%A)
