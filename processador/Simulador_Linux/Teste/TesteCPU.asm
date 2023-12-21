; Teste das instrucoes que vao sendo implementadas!


; 4 Perguntas ao implemantar as instrucoes:
;	1) O Que preciso fazer para esta instrucao?
;	2) Onde Comeca: Pegargcc o que tem que fazer e ir voltando ate' chegar em um registrador (ie. PC)
;	3) Qual e' a Sequencia de Operacoes: Descrever todos os comandos que tem que dar nos cilos de Dec e Exec
;	4) Ja' terminou??? Cumpriu o que tinha que fazer??? O PC esta' pronto para a proxima instrucao (cuidado com Load, Loadn, Store, Jmp, Call)
	; Teste do XCHG
    loadn r1, #'Q'     ; Load 'Q' into r1
    loadn r2, #'R'     ; Load 'R' into r2
	loadn r0, #20      ; Set the position for output
    outchar r1, r0     ; Output the contents of r1
    loadn r0, #22      ; Set the position for the next output
    outchar r2, r0     ; Output the contents of r2 
    XCHG r1, r2        ; Swap the contents of r1 and r2
    loadn r0, #32      ; Set the position for output
    outchar r1, r0     ; Output the contents of r1 (should be 'R')
    loadn r0, #34      ; Set the position for the next output
    outchar r2, r0     ; Output the contents of r2 (should be 'Q')


	
	
Fim:	
	halt

	
Dado : var #1  ; O comando VAR aloca bytes de memoria e associa o primeiro byte ao LABEL
static Dado + #0, #'B'

	
	
	
	
	
	
	
	
	
