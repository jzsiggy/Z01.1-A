; ------------------------------------
; Calcule a média dos valores de um vetor
; que possui inicio em RAM[5] e tamanho
; defindo em RAM[4],
;
; 1. Salve a soma em RAM[1]
; 2. Salve a média em RAM[0]
; 
; ------------------------------------
; antes       | depois
;             |
; RAM[0]:     | RAM[0]:  2  : média 
; RAM[1]:     | RAM[1]:  8  : soma
; RAM[2]:     | RAM[2]:  
; RAM[3]:     | RAM[3]:  
; RAM[4]:  4  | RAM[4]:  4 
; RAM[5]:  1  | RAM[5]:  1 - 
; RAM[6]:  2  | RAM[6]:  2 | vetor
; RAM[7]:  1  | RAM[7]:  1 |
; RAM[8]:  4  | RAM[8]:  4 -
; ------------------------------------

leaw $5, %A
movw %A, %D
leaw $4, %A
addw %D, (%A), %D
leaw $2, %A
movw %D, (%A) ; Armazena em RAM[2] ate qual indice deve ser somado

leaw $5, %A
movw %A, %D
leaw $counter, %A
movw %D, (%A) ; Inicia counter em 5

DO:
leaw $counter, %A
movw (%A), %D
leaw $2, %A
subw (%A), %D, %D

leaw $BREAK, %A
je %D
nop                 ; checa se counter maior que valor esperado e jmp

leaw $counter, %A
movw (%A), %D
movw %D, %A
movw (%A), %D       ; carrega em %D o valor armazenado em RAM[counter]
leaw $1, %A
addw (%A), %D, %D
movw %D, (%A)       ; armazena a soma em RAM[%A = 1]

leaw $counter, %A
movw (%A), %D
incw %D
movw %D, (%A)       ; incrementa counter

leaw $DO, %A
jmp
nop

BREAK:
leaw $1, %A
movw (%A), %D
leaw $SUM, %A
movw %D, (%A)

; RAM[SUM] / RAM[4]

leaw $0, %A  
movw %A, %D
leaw $DIVIDE_COUNTER, %A
movw %D, (%A)   ;fazendo um counter. valor inicial 0

LOOP:
leaw $SUM, %A
movw (%A), %D
leaw $4, %A
subw %D, (%A), %D  ;RAM[1] - RAM[4]
leaw $SUM, %A
movw %D, (%A)
leaw $END, %A
jl  ;enquanto RAM[1] - RAM[4] >= 0:
nop

leaw $DIVIDE_COUNTER, %A
movw (%A), %D
addw $1, %D, %D
movw %D, (%A) ; incw %counter

leaw $LOOP, %A
jmp
nop

END:

leaw $DIVIDE_COUNTER, %A
movw (%A), %D
leaw $0, %A
movw %D, (%A)
