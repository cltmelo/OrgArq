jmp main

Letra: var #1

denisOfiPosition : var #1

denisOfi : var #1
  static denisOfi + #0, #2816 ;  DenisDj

denisOfiGaps : var #1
  static denisOfiGaps + #0, #0

main:
call printtelaInicialScreen
call gameLoop


;Funcoes -------------
gameLoop:
	call waitForSpace
	call printteladeJogoScreen
	call printdenisOfi
    call handleInput
    ; Outras lógicas do jogo...
    rts
printdenisOfi:
  push R0
  push R1
  push R2
  push R3
  push R4
  push R5
  push R6
  loadn r0, #14  ; y-coordinate
  loadn r1, #39  ; screen width
  mul r0, r0, r1 ; r0 = y * width
  loadn r1, #32  ; x-coordinate
  add r0, r0, r1 ; r0 = y * width + x

; Store initial position in denisOfiPosition
store denisOfiPosition, r0

  loadn R0, #denisOfi
  loadn R1, #denisOfiGaps
  load R2, denisOfiPosition
  loadn R3, #1 ;tamanho denisOfi
  loadn R4, #0 ;incremetador

  printdenisOfiLoop:
    add R5,R0,R4
    loadi R5, R5

    add R6,R1,R4
    loadi R6, R6

    add R2, R2, R6

    outchar R5, R2

    inc R2
     inc R4
     cmp R3, R4
    jne printdenisOfiLoop

  pop R6
  pop R5
  pop R4
  pop R3
  pop R2
  pop R1
  pop R0
  rts

apagardenisOfi:
  push R0
  push R1
  push R2
  push R3
  push R4
  push R5

  loadn R0, #3967
  loadn R1, #denisOfiGaps
  load R2, denisOfiPosition
  loadn R3, #1 ;tamanho denisOfi
  loadn R4, #0 ;incremetador

  apagardenisOfiLoop:
    add R5,R1,R4
    loadi R5, R5

    add R2,R2,R5
    outchar R0, R2

    inc R2
     inc R4
     cmp R3, R4
    jne apagardenisOfiLoop

  pop R5
  pop R4
  pop R3
  pop R2
  pop R1
  pop R0
  rts


checkCollision:
    ; Add logic to compare positions of denisOfi and chinelo
    ; If positions are the same or overlap, set a flag or directly call printtelaFinalScreen
    rts
    
printtelaInicialScreen:
  push R0
  push R1
  push R2
  push R3

  loadn R0, #telaInicial
  loadn R1, #0
  loadn R2, #1200

  printtelaInicialScreenLoop:

    add R3,R0,R1
    loadi R3, R3
    outchar R3, R1
    inc R1
    cmp R1, R2

    jne printtelaInicialScreenLoop

  pop R3
  pop R2
  pop R1
  pop R0
  rts

printteladeJogoScreen:
  push R0
  push R1
  push R2
  push R3

  loadn R0, #teladeJogo
  loadn R1, #0
  loadn R2, #1200

  printteladeJogoScreenLoop:

    add R3,R0,R1
    loadi R3, R3
    outchar R3, R1
    inc R1
    cmp R1, R2

    jne printteladeJogoScreenLoop

  pop R3
  pop R2
  pop R1
  pop R0
  rts

printtelaFinalScreen:
  push R0
  push R1
  push R2
  push R3

  loadn R0, #telaFinal
  loadn R1, #0
  loadn R2, #1200

  printtelaFinalScreenLoop:

    add R3,R0,R1
    loadi R3, R3
    outchar R3, R1
    inc R1
    cmp R1, R2

    jne printtelaFinalScreenLoop

  pop R3
  pop R2
  pop R1
  pop R0
  rts
  
waitForSpace:
    call DigLetra          ; Read a letter
    loadn r0, #' '         ; ASCII code for space
    load r1, Letra
    cmp r0, r1
    jne waitForSpace       ; Loop back if not space
    rts  
    
waitForS:
    call DigLetra          ; Read a letter
    loadn r0, #'S'         ; ASCII code for space
    load r1, Letra
    cmp r0, r1
    jne waitForS       ; Loop back if not space
    rts  

DigLetra:	; Espera que uma tecla seja digitada e salva na variavel global "Letra"
	push r0
	push r1
	loadn r1, #255	; Se nao digitar nada vem 255

   DigLetra_Loop:
		inchar r0			; Le o teclado, se nada for digitado = 255
		cmp r0, r1			;compara r0 com 255
		jeq DigLetra_Loop	; Fica lendo ate' que digite uma tecla valida

	store Letra, r0			; Salva a tecla na variavel global "Letra"

	pop r1
	pop r0
	rts

handleInput:
    call DigLetra          ; Read a letter into 'Letra'
    load r1, Letra

    loadn r0, #'W'
    cmp r0, r1
    jeq moveUp


    rts

moveUp:
    push R0
    push R1
    call apagardenisOfi    ; Apaga o personagem da posição atual

    load R0, denisOfiPosition
    loadn R1, #39          ; Largura da tela
    sub R0, R0, R1         ; Move para cima uma linha
    loadn R1, #0
    cmp R0, R1
    jne endMoveUp
    
    store denisOfiPosition, R0 ; Atualiza a posição
    call printdenisOfi     ; Desenha o personagem na nova posição

endMoveUp:
    pop R1
    pop R0
    rts
  
moveLeft:
    ; Adjust denisOfiPosition to move left
    rts

moveDown:
    ; Adjust denisOfiPosition to move down
    rts

moveRight:
    ; Adjust denisOfiPosition to move right
    rts



;Telas -------------------

telaInicial : var #1200
  ;Linha 0
  static telaInicial + #0, #3967
  static telaInicial + #1, #3967
  static telaInicial + #2, #3967
  static telaInicial + #3, #3967
  static telaInicial + #4, #3967
  static telaInicial + #5, #3967
  static telaInicial + #6, #3967
  static telaInicial + #7, #3967
  static telaInicial + #8, #3967
  static telaInicial + #9, #3967
  static telaInicial + #10, #3967
  static telaInicial + #11, #3967
  static telaInicial + #12, #3967
  static telaInicial + #13, #3967
  static telaInicial + #14, #3967
  static telaInicial + #15, #3967
  static telaInicial + #16, #3967
  static telaInicial + #17, #3967
  static telaInicial + #18, #3967
  static telaInicial + #19, #3967
  static telaInicial + #20, #3967
  static telaInicial + #21, #3967
  static telaInicial + #22, #3967
  static telaInicial + #23, #3967
  static telaInicial + #24, #3967
  static telaInicial + #25, #3967
  static telaInicial + #26, #3967
  static telaInicial + #27, #3967
  static telaInicial + #28, #3967
  static telaInicial + #29, #3967
  static telaInicial + #30, #3967
  static telaInicial + #31, #3967
  static telaInicial + #32, #3967
  static telaInicial + #33, #3967
  static telaInicial + #34, #3967
  static telaInicial + #35, #3967
  static telaInicial + #36, #3967
  static telaInicial + #37, #3967
  static telaInicial + #38, #3967
  static telaInicial + #39, #3967

  ;Linha 1
  static telaInicial + #40, #3967
  static telaInicial + #41, #3967
  static telaInicial + #42, #3967
  static telaInicial + #43, #3967
  static telaInicial + #44, #3967
  static telaInicial + #45, #3967
  static telaInicial + #46, #3967
  static telaInicial + #47, #3967
  static telaInicial + #48, #3967
  static telaInicial + #49, #3967
  static telaInicial + #50, #3967
  static telaInicial + #51, #3967
  static telaInicial + #52, #3967
  static telaInicial + #53, #3967
  static telaInicial + #54, #3967
  static telaInicial + #55, #3967
  static telaInicial + #56, #3967
  static telaInicial + #57, #3967
  static telaInicial + #58, #3967
  static telaInicial + #59, #3967
  static telaInicial + #60, #3967
  static telaInicial + #61, #3967
  static telaInicial + #62, #3967
  static telaInicial + #63, #3967
  static telaInicial + #64, #3967
  static telaInicial + #65, #3967
  static telaInicial + #66, #3967
  static telaInicial + #67, #3967
  static telaInicial + #68, #3967
  static telaInicial + #69, #3967
  static telaInicial + #70, #3967
  static telaInicial + #71, #3967
  static telaInicial + #72, #3967
  static telaInicial + #73, #3967
  static telaInicial + #74, #3967
  static telaInicial + #75, #3967
  static telaInicial + #76, #3967
  static telaInicial + #77, #3967
  static telaInicial + #78, #3967
  static telaInicial + #79, #3967

  ;Linha 2
  static telaInicial + #80, #3967
  static telaInicial + #81, #3967
  static telaInicial + #82, #3967
  static telaInicial + #83, #3967
  static telaInicial + #84, #3967
  static telaInicial + #85, #3967
  static telaInicial + #86, #3967
  static telaInicial + #87, #3967
  static telaInicial + #88, #3967
  static telaInicial + #89, #3967
  static telaInicial + #90, #3967
  static telaInicial + #91, #3967
  static telaInicial + #92, #3967
  static telaInicial + #93, #3967
  static telaInicial + #94, #3967
  static telaInicial + #95, #3967
  static telaInicial + #96, #3967
  static telaInicial + #97, #3967
  static telaInicial + #98, #3967
  static telaInicial + #99, #3967
  static telaInicial + #100, #3967
  static telaInicial + #101, #3967
  static telaInicial + #102, #3967
  static telaInicial + #103, #3967
  static telaInicial + #104, #3967
  static telaInicial + #105, #3967
  static telaInicial + #106, #3967
  static telaInicial + #107, #3967
  static telaInicial + #108, #3967
  static telaInicial + #109, #3967
  static telaInicial + #110, #3967
  static telaInicial + #111, #3967
  static telaInicial + #112, #3967
  static telaInicial + #113, #3967
  static telaInicial + #114, #3967
  static telaInicial + #115, #3967
  static telaInicial + #116, #3967
  static telaInicial + #117, #3967
  static telaInicial + #118, #3967
  static telaInicial + #119, #3967

  ;Linha 3
  static telaInicial + #120, #3967
  static telaInicial + #121, #3967
  static telaInicial + #122, #3967
  static telaInicial + #123, #3967
  static telaInicial + #124, #3967
  static telaInicial + #125, #3967
  static telaInicial + #126, #3967
  static telaInicial + #127, #3967
  static telaInicial + #128, #3967
  static telaInicial + #129, #3967
  static telaInicial + #130, #3967
  static telaInicial + #131, #3967
  static telaInicial + #132, #3967
  static telaInicial + #133, #3967
  static telaInicial + #134, #3967
  static telaInicial + #135, #3967
  static telaInicial + #136, #3967
  static telaInicial + #137, #3967
  static telaInicial + #138, #3967
  static telaInicial + #139, #3967
  static telaInicial + #140, #3967
  static telaInicial + #141, #3967
  static telaInicial + #142, #3967
  static telaInicial + #143, #3967
  static telaInicial + #144, #3967
  static telaInicial + #145, #3967
  static telaInicial + #146, #3967
  static telaInicial + #147, #3967
  static telaInicial + #148, #3967
  static telaInicial + #149, #3967
  static telaInicial + #150, #3967
  static telaInicial + #151, #3967
  static telaInicial + #152, #3967
  static telaInicial + #153, #3967
  static telaInicial + #154, #3967
  static telaInicial + #155, #3967
  static telaInicial + #156, #3967
  static telaInicial + #157, #3967
  static telaInicial + #158, #3967
  static telaInicial + #159, #3967

  ;Linha 4
  static telaInicial + #160, #3967
  static telaInicial + #161, #3967
  static telaInicial + #162, #3967
  static telaInicial + #163, #3967
  static telaInicial + #164, #3967
  static telaInicial + #165, #3967
  static telaInicial + #166, #3967
  static telaInicial + #167, #3967
  static telaInicial + #168, #3967
  static telaInicial + #169, #3967
  static telaInicial + #170, #3967
  static telaInicial + #171, #3967
  static telaInicial + #172, #3967
  static telaInicial + #173, #3967
  static telaInicial + #174, #3967
  static telaInicial + #175, #3967
  static telaInicial + #176, #3967
  static telaInicial + #177, #3967
  static telaInicial + #178, #3967
  static telaInicial + #179, #3967
  static telaInicial + #180, #3967
  static telaInicial + #181, #3967
  static telaInicial + #182, #3967
  static telaInicial + #183, #3967
  static telaInicial + #184, #3967
  static telaInicial + #185, #3967
  static telaInicial + #186, #3967
  static telaInicial + #187, #3967
  static telaInicial + #188, #3967
  static telaInicial + #189, #3967
  static telaInicial + #190, #3967
  static telaInicial + #191, #3967
  static telaInicial + #192, #3967
  static telaInicial + #193, #3967
  static telaInicial + #194, #3967
  static telaInicial + #195, #3967
  static telaInicial + #196, #3967
  static telaInicial + #197, #3967
  static telaInicial + #198, #3967
  static telaInicial + #199, #3967

  ;Linha 5
  static telaInicial + #200, #3967
  static telaInicial + #201, #3967
  static telaInicial + #202, #3967
  static telaInicial + #203, #3967
  static telaInicial + #204, #3967
  static telaInicial + #205, #3967
  static telaInicial + #206, #3967
  static telaInicial + #207, #3967
  static telaInicial + #208, #3967
  static telaInicial + #209, #3967
  static telaInicial + #210, #3967
  static telaInicial + #211, #3967
  static telaInicial + #212, #3967
  static telaInicial + #213, #3967
  static telaInicial + #214, #3967
  static telaInicial + #215, #3967
  static telaInicial + #216, #3967
  static telaInicial + #217, #3967
  static telaInicial + #218, #3967
  static telaInicial + #219, #3967
  static telaInicial + #220, #3967
  static telaInicial + #221, #3967
  static telaInicial + #222, #3967
  static telaInicial + #223, #3967
  static telaInicial + #224, #3967
  static telaInicial + #225, #3967
  static telaInicial + #226, #3967
  static telaInicial + #227, #3967
  static telaInicial + #228, #3967
  static telaInicial + #229, #3967
  static telaInicial + #230, #3967
  static telaInicial + #231, #3967
  static telaInicial + #232, #3967
  static telaInicial + #233, #3967
  static telaInicial + #234, #3967
  static telaInicial + #235, #3967
  static telaInicial + #236, #3967
  static telaInicial + #237, #3967
  static telaInicial + #238, #3967
  static telaInicial + #239, #3967

  ;Linha 6
  static telaInicial + #240, #3967
  static telaInicial + #241, #3967
  static telaInicial + #242, #3967
  static telaInicial + #243, #3967
  static telaInicial + #244, #3967
  static telaInicial + #245, #3967
  static telaInicial + #246, #3967
  static telaInicial + #247, #3967
  static telaInicial + #248, #3967
  static telaInicial + #249, #3967
  static telaInicial + #250, #3967
  static telaInicial + #251, #3967
  static telaInicial + #252, #3967
  static telaInicial + #253, #3967
  static telaInicial + #254, #3967
  static telaInicial + #255, #3967
  static telaInicial + #256, #3967
  static telaInicial + #257, #3967
  static telaInicial + #258, #3967
  static telaInicial + #259, #3967
  static telaInicial + #260, #3967
  static telaInicial + #261, #3967
  static telaInicial + #262, #3967
  static telaInicial + #263, #3967
  static telaInicial + #264, #3967
  static telaInicial + #265, #3967
  static telaInicial + #266, #3967
  static telaInicial + #267, #3967
  static telaInicial + #268, #3967
  static telaInicial + #269, #3967
  static telaInicial + #270, #3967
  static telaInicial + #271, #3967
  static telaInicial + #272, #3967
  static telaInicial + #273, #3967
  static telaInicial + #274, #3967
  static telaInicial + #275, #3967
  static telaInicial + #276, #3967
  static telaInicial + #277, #3967
  static telaInicial + #278, #3967
  static telaInicial + #279, #3967

  ;Linha 7
  static telaInicial + #280, #2877
  static telaInicial + #281, #2877
  static telaInicial + #282, #2877
  static telaInicial + #283, #2877
  static telaInicial + #284, #2877
  static telaInicial + #285, #2877
  static telaInicial + #286, #2877
  static telaInicial + #287, #2877
  static telaInicial + #288, #2877
  static telaInicial + #289, #2877
  static telaInicial + #290, #2877
  static telaInicial + #291, #2877
  static telaInicial + #292, #2877
  static telaInicial + #293, #2877
  static telaInicial + #294, #2877
  static telaInicial + #295, #2372
  static telaInicial + #296, #2405
  static telaInicial + #297, #2414
  static telaInicial + #298, #2409
  static telaInicial + #299, #2419
  static telaInicial + #300, #2877
  static telaInicial + #301, #2372
  static telaInicial + #302, #2378
  static telaInicial + #303, #2877
  static telaInicial + #304, #2877
  static telaInicial + #305, #2877
  static telaInicial + #306, #2877
  static telaInicial + #307, #2877
  static telaInicial + #308, #2877
  static telaInicial + #309, #2877
  static telaInicial + #310, #2877
  static telaInicial + #311, #2877
  static telaInicial + #312, #2877
  static telaInicial + #313, #2877
  static telaInicial + #314, #2877
  static telaInicial + #315, #2877
  static telaInicial + #316, #2877
  static telaInicial + #317, #2877
  static telaInicial + #318, #2877
  static telaInicial + #319, #2877

  ;Linha 8
  static telaInicial + #320, #3967
  static telaInicial + #321, #3967
  static telaInicial + #322, #3967
  static telaInicial + #323, #3967
  static telaInicial + #324, #3967
  static telaInicial + #325, #3967
  static telaInicial + #326, #2819
  static telaInicial + #327, #2819
  static telaInicial + #328, #3967
  static telaInicial + #329, #2819
  static telaInicial + #330, #3967
  static telaInicial + #331, #2819
  static telaInicial + #332, #3967
  static telaInicial + #333, #2819
  static telaInicial + #334, #3967
  static telaInicial + #335, #3967
  static telaInicial + #336, #2819
  static telaInicial + #337, #2819
  static telaInicial + #338, #3967
  static telaInicial + #339, #3967
  static telaInicial + #340, #2819
  static telaInicial + #341, #2819
  static telaInicial + #342, #2819
  static telaInicial + #343, #3967
  static telaInicial + #344, #2819
  static telaInicial + #345, #3967
  static telaInicial + #346, #3967
  static telaInicial + #347, #3967
  static telaInicial + #348, #3967
  static telaInicial + #349, #2819
  static telaInicial + #350, #2819
  static telaInicial + #351, #3967
  static telaInicial + #352, #3967
  static telaInicial + #353, #3967
  static telaInicial + #354, #3967
  static telaInicial + #355, #3967
  static telaInicial + #356, #3967
  static telaInicial + #357, #3967
  static telaInicial + #358, #3967
  static telaInicial + #359, #3967

  ;Linha 9
  static telaInicial + #360, #3967
  static telaInicial + #361, #3967
  static telaInicial + #362, #3967
  static telaInicial + #363, #3967
  static telaInicial + #364, #3967
  static telaInicial + #365, #2819
  static telaInicial + #366, #3967
  static telaInicial + #367, #3967
  static telaInicial + #368, #3967
  static telaInicial + #369, #2819
  static telaInicial + #370, #3967
  static telaInicial + #371, #2819
  static telaInicial + #372, #3967
  static telaInicial + #373, #2819
  static telaInicial + #374, #3967
  static telaInicial + #375, #2819
  static telaInicial + #376, #3967
  static telaInicial + #377, #3967
  static telaInicial + #378, #2819
  static telaInicial + #379, #3967
  static telaInicial + #380, #2819
  static telaInicial + #381, #2819
  static telaInicial + #382, #2819
  static telaInicial + #383, #3967
  static telaInicial + #384, #2819
  static telaInicial + #385, #3967
  static telaInicial + #386, #3967
  static telaInicial + #387, #3967
  static telaInicial + #388, #2819
  static telaInicial + #389, #3967
  static telaInicial + #390, #3967
  static telaInicial + #391, #2819
  static telaInicial + #392, #3967
  static telaInicial + #393, #3967
  static telaInicial + #394, #3967
  static telaInicial + #395, #3967
  static telaInicial + #396, #3967
  static telaInicial + #397, #3967
  static telaInicial + #398, #3967
  static telaInicial + #399, #3967

  ;Linha 10
  static telaInicial + #400, #3967
  static telaInicial + #401, #3967
  static telaInicial + #402, #3967
  static telaInicial + #403, #3967
  static telaInicial + #404, #3967
  static telaInicial + #405, #2819
  static telaInicial + #406, #3967
  static telaInicial + #407, #3967
  static telaInicial + #408, #3967
  static telaInicial + #409, #2819
  static telaInicial + #410, #2819
  static telaInicial + #411, #2819
  static telaInicial + #412, #3967
  static telaInicial + #413, #2819
  static telaInicial + #414, #3967
  static telaInicial + #415, #2819
  static telaInicial + #416, #3967
  static telaInicial + #417, #3967
  static telaInicial + #418, #2819
  static telaInicial + #419, #3967
  static telaInicial + #420, #2819
  static telaInicial + #421, #3967
  static telaInicial + #422, #3967
  static telaInicial + #423, #3967
  static telaInicial + #424, #2819
  static telaInicial + #425, #3967
  static telaInicial + #426, #3967
  static telaInicial + #427, #3967
  static telaInicial + #428, #2819
  static telaInicial + #429, #3967
  static telaInicial + #430, #3967
  static telaInicial + #431, #2819
  static telaInicial + #432, #3967
  static telaInicial + #433, #3967
  static telaInicial + #434, #3967
  static telaInicial + #435, #3967
  static telaInicial + #436, #3967
  static telaInicial + #437, #3967
  static telaInicial + #438, #3967
  static telaInicial + #439, #3967

  ;Linha 11
  static telaInicial + #440, #3967
  static telaInicial + #441, #3967
  static telaInicial + #442, #3967
  static telaInicial + #443, #3967
  static telaInicial + #444, #3967
  static telaInicial + #445, #3967
  static telaInicial + #446, #2819
  static telaInicial + #447, #2819
  static telaInicial + #448, #3967
  static telaInicial + #449, #2819
  static telaInicial + #450, #3967
  static telaInicial + #451, #2819
  static telaInicial + #452, #3967
  static telaInicial + #453, #2819
  static telaInicial + #454, #3967
  static telaInicial + #455, #2819
  static telaInicial + #456, #3967
  static telaInicial + #457, #3967
  static telaInicial + #458, #2819
  static telaInicial + #459, #3967
  static telaInicial + #460, #2819
  static telaInicial + #461, #2819
  static telaInicial + #462, #2819
  static telaInicial + #463, #3967
  static telaInicial + #464, #2819
  static telaInicial + #465, #2819
  static telaInicial + #466, #2819
  static telaInicial + #467, #3967
  static telaInicial + #468, #3967
  static telaInicial + #469, #2819
  static telaInicial + #470, #2819
  static telaInicial + #471, #3967
  static telaInicial + #472, #3967
  static telaInicial + #473, #3967
  static telaInicial + #474, #3967
  static telaInicial + #475, #3967
  static telaInicial + #476, #3967
  static telaInicial + #477, #3967
  static telaInicial + #478, #3967
  static telaInicial + #479, #3967

  ;Linha 12
  static telaInicial + #480, #2877
  static telaInicial + #481, #2877
  static telaInicial + #482, #2877
  static telaInicial + #483, #2877
  static telaInicial + #484, #2877
  static telaInicial + #485, #2877
  static telaInicial + #486, #2877
  static telaInicial + #487, #2877
  static telaInicial + #488, #2877
  static telaInicial + #489, #2877
  static telaInicial + #490, #2877
  static telaInicial + #491, #2877
  static telaInicial + #492, #2877
  static telaInicial + #493, #2877
  static telaInicial + #494, #2877
  static telaInicial + #495, #2388
  static telaInicial + #496, #2376
  static telaInicial + #497, #2373
  static telaInicial + #498, #2877
  static telaInicial + #499, #2375
  static telaInicial + #500, #2369
  static telaInicial + #501, #2381
  static telaInicial + #502, #2373
  static telaInicial + #503, #2877
  static telaInicial + #504, #2877
  static telaInicial + #505, #2877
  static telaInicial + #506, #2877
  static telaInicial + #507, #2877
  static telaInicial + #508, #2877
  static telaInicial + #509, #2877
  static telaInicial + #510, #2877
  static telaInicial + #511, #2877
  static telaInicial + #512, #2877
  static telaInicial + #513, #2877
  static telaInicial + #514, #2877
  static telaInicial + #515, #2877
  static telaInicial + #516, #2877
  static telaInicial + #517, #2877
  static telaInicial + #518, #2877
  static telaInicial + #519, #2877

  ;Linha 13
  static telaInicial + #520, #3967
  static telaInicial + #521, #3967
  static telaInicial + #522, #3967
  static telaInicial + #523, #3967
  static telaInicial + #524, #3967
  static telaInicial + #525, #3967
  static telaInicial + #526, #3967
  static telaInicial + #527, #3967
  static telaInicial + #528, #3967
  static telaInicial + #529, #3967
  static telaInicial + #530, #3967
  static telaInicial + #531, #3967
  static telaInicial + #532, #3967
  static telaInicial + #533, #3967
  static telaInicial + #534, #3967
  static telaInicial + #535, #3967
  static telaInicial + #536, #3967
  static telaInicial + #537, #3967
  static telaInicial + #538, #3967
  static telaInicial + #539, #3967
  static telaInicial + #540, #3967
  static telaInicial + #541, #3967
  static telaInicial + #542, #3967
  static telaInicial + #543, #3967
  static telaInicial + #544, #3967
  static telaInicial + #545, #3967
  static telaInicial + #546, #3967
  static telaInicial + #547, #3967
  static telaInicial + #548, #3967
  static telaInicial + #549, #3967
  static telaInicial + #550, #3967
  static telaInicial + #551, #3967
  static telaInicial + #552, #3967
  static telaInicial + #553, #3967
  static telaInicial + #554, #3967
  static telaInicial + #555, #3967
  static telaInicial + #556, #3967
  static telaInicial + #557, #3967
  static telaInicial + #558, #3967
  static telaInicial + #559, #3967

  ;Linha 14
  static telaInicial + #560, #3967
  static telaInicial + #561, #3967
  static telaInicial + #562, #3967
  static telaInicial + #563, #3967
  static telaInicial + #564, #3967
  static telaInicial + #565, #3967
  static telaInicial + #566, #3967
  static telaInicial + #567, #3967
  static telaInicial + #568, #3967
  static telaInicial + #569, #3967
  static telaInicial + #570, #3967
  static telaInicial + #571, #3967
  static telaInicial + #572, #3967
  static telaInicial + #573, #3967
  static telaInicial + #574, #3967
  static telaInicial + #575, #3967
  static telaInicial + #576, #3967
  static telaInicial + #577, #3967
  static telaInicial + #578, #3967
  static telaInicial + #579, #3967
  static telaInicial + #580, #3967
  static telaInicial + #581, #3967
  static telaInicial + #582, #3967
  static telaInicial + #583, #3967
  static telaInicial + #584, #3967
  static telaInicial + #585, #3967
  static telaInicial + #586, #3967
  static telaInicial + #587, #3967
  static telaInicial + #588, #3967
  static telaInicial + #589, #3967
  static telaInicial + #590, #3967
  static telaInicial + #591, #3967
  static telaInicial + #592, #3967
  static telaInicial + #593, #3967
  static telaInicial + #594, #3967
  static telaInicial + #595, #3967
  static telaInicial + #596, #3967
  static telaInicial + #597, #3967
  static telaInicial + #598, #3967
  static telaInicial + #599, #3967

  ;Linha 15
  static telaInicial + #600, #3967
  static telaInicial + #601, #3967
  static telaInicial + #602, #3967
  static telaInicial + #603, #3967
  static telaInicial + #604, #3967
  static telaInicial + #605, #3967
  static telaInicial + #606, #3967
  static telaInicial + #607, #3967
  static telaInicial + #608, #3967
  static telaInicial + #609, #3967
  static telaInicial + #610, #3967
  static telaInicial + #611, #3967
  static telaInicial + #612, #3967
  static telaInicial + #613, #3967
  static telaInicial + #614, #65
  static telaInicial + #615, #80
  static telaInicial + #616, #69
  static telaInicial + #617, #82
  static telaInicial + #618, #84
  static telaInicial + #619, #69
  static telaInicial + #620, #3967
  static telaInicial + #621, #83
  static telaInicial + #622, #80
  static telaInicial + #623, #65
  static telaInicial + #624, #67
  static telaInicial + #625, #69
  static telaInicial + #626, #3967
  static telaInicial + #627, #3967
  static telaInicial + #628, #3967
  static telaInicial + #629, #3967
  static telaInicial + #630, #3967
  static telaInicial + #631, #3967
  static telaInicial + #632, #3967
  static telaInicial + #633, #3967
  static telaInicial + #634, #3967
  static telaInicial + #635, #3967
  static telaInicial + #636, #3967
  static telaInicial + #637, #3967
  static telaInicial + #638, #3967
  static telaInicial + #639, #3967

  ;Linha 16
  static telaInicial + #640, #3967
  static telaInicial + #641, #3967
  static telaInicial + #642, #3967
  static telaInicial + #643, #3967
  static telaInicial + #644, #3967
  static telaInicial + #645, #3967
  static telaInicial + #646, #3967
  static telaInicial + #647, #3967
  static telaInicial + #648, #3967
  static telaInicial + #649, #3967
  static telaInicial + #650, #3967
  static telaInicial + #651, #3967
  static telaInicial + #652, #3967
  static telaInicial + #653, #3967
  static telaInicial + #654, #3967
  static telaInicial + #655, #3967
  static telaInicial + #656, #3967
  static telaInicial + #657, #3967
  static telaInicial + #658, #3967
  static telaInicial + #659, #3967
  static telaInicial + #660, #3967
  static telaInicial + #661, #3967
  static telaInicial + #662, #3967
  static telaInicial + #663, #3967
  static telaInicial + #664, #3967
  static telaInicial + #665, #3967
  static telaInicial + #666, #3967
  static telaInicial + #667, #3967
  static telaInicial + #668, #3967
  static telaInicial + #669, #3967
  static telaInicial + #670, #3967
  static telaInicial + #671, #3967
  static telaInicial + #672, #3967
  static telaInicial + #673, #3967
  static telaInicial + #674, #3967
  static telaInicial + #675, #3967
  static telaInicial + #676, #3967
  static telaInicial + #677, #3967
  static telaInicial + #678, #3967
  static telaInicial + #679, #3967

  ;Linha 17
  static telaInicial + #680, #3967
  static telaInicial + #681, #3967
  static telaInicial + #682, #3967
  static telaInicial + #683, #3967
  static telaInicial + #684, #3967
  static telaInicial + #685, #3967
  static telaInicial + #686, #3967
  static telaInicial + #687, #3967
  static telaInicial + #688, #3967
  static telaInicial + #689, #3967
  static telaInicial + #690, #3967
  static telaInicial + #691, #3967
  static telaInicial + #692, #3967
  static telaInicial + #693, #3967
  static telaInicial + #694, #61
  static telaInicial + #695, #61
  static telaInicial + #696, #80
  static telaInicial + #697, #65
  static telaInicial + #698, #82
  static telaInicial + #699, #65
  static telaInicial + #700, #61
  static telaInicial + #701, #73
  static telaInicial + #702, #78
  static telaInicial + #703, #73
  static telaInicial + #704, #67
  static telaInicial + #705, #73
  static telaInicial + #706, #65
  static telaInicial + #707, #82
  static telaInicial + #708, #61
  static telaInicial + #709, #61
  static telaInicial + #710, #3967
  static telaInicial + #711, #3967
  static telaInicial + #712, #3967
  static telaInicial + #713, #3967
  static telaInicial + #714, #3967
  static telaInicial + #715, #3967
  static telaInicial + #716, #3967
  static telaInicial + #717, #3967
  static telaInicial + #718, #3967
  static telaInicial + #719, #3967

  ;Linha 18
  static telaInicial + #720, #3967
  static telaInicial + #721, #3967
  static telaInicial + #722, #3967
  static telaInicial + #723, #3967
  static telaInicial + #724, #3967
  static telaInicial + #725, #3967
  static telaInicial + #726, #3967
  static telaInicial + #727, #3967
  static telaInicial + #728, #3967
  static telaInicial + #729, #3967
  static telaInicial + #730, #3967
  static telaInicial + #731, #3967
  static telaInicial + #732, #3967
  static telaInicial + #733, #3967
  static telaInicial + #734, #3967
  static telaInicial + #735, #3967
  static telaInicial + #736, #3967
  static telaInicial + #737, #3967
  static telaInicial + #738, #3967
  static telaInicial + #739, #3967
  static telaInicial + #740, #3967
  static telaInicial + #741, #3967
  static telaInicial + #742, #3967
  static telaInicial + #743, #3967
  static telaInicial + #744, #3967
  static telaInicial + #745, #3967
  static telaInicial + #746, #3967
  static telaInicial + #747, #3967
  static telaInicial + #748, #3967
  static telaInicial + #749, #3967
  static telaInicial + #750, #3967
  static telaInicial + #751, #3967
  static telaInicial + #752, #3967
  static telaInicial + #753, #3967
  static telaInicial + #754, #3967
  static telaInicial + #755, #3967
  static telaInicial + #756, #3967
  static telaInicial + #757, #3967
  static telaInicial + #758, #3967
  static telaInicial + #759, #3967

  ;Linha 19
  static telaInicial + #760, #3967
  static telaInicial + #761, #3967
  static telaInicial + #762, #3967
  static telaInicial + #763, #3967
  static telaInicial + #764, #3967
  static telaInicial + #765, #3967
  static telaInicial + #766, #3967
  static telaInicial + #767, #3967
  static telaInicial + #768, #3967
  static telaInicial + #769, #3967
  static telaInicial + #770, #3967
  static telaInicial + #771, #3967
  static telaInicial + #772, #3967
  static telaInicial + #773, #3967
  static telaInicial + #774, #3967
  static telaInicial + #775, #3967
  static telaInicial + #776, #3967
  static telaInicial + #777, #3967
  static telaInicial + #778, #3967
  static telaInicial + #779, #3967
  static telaInicial + #780, #3967
  static telaInicial + #781, #3967
  static telaInicial + #782, #3967
  static telaInicial + #783, #3967
  static telaInicial + #784, #3967
  static telaInicial + #785, #3967
  static telaInicial + #786, #3967
  static telaInicial + #787, #3967
  static telaInicial + #788, #3967
  static telaInicial + #789, #3967
  static telaInicial + #790, #3967
  static telaInicial + #791, #3967
  static telaInicial + #792, #3967
  static telaInicial + #793, #3967
  static telaInicial + #794, #3967
  static telaInicial + #795, #3967
  static telaInicial + #796, #3967
  static telaInicial + #797, #3967
  static telaInicial + #798, #3967
  static telaInicial + #799, #3967

  ;Linha 20
  static telaInicial + #800, #3967
  static telaInicial + #801, #3967
  static telaInicial + #802, #3967
  static telaInicial + #803, #3967
  static telaInicial + #804, #3967
  static telaInicial + #805, #3967
  static telaInicial + #806, #3967
  static telaInicial + #807, #3967
  static telaInicial + #808, #3967
  static telaInicial + #809, #3967
  static telaInicial + #810, #3967
  static telaInicial + #811, #3967
  static telaInicial + #812, #3967
  static telaInicial + #813, #3967
  static telaInicial + #814, #3967
  static telaInicial + #815, #3967
  static telaInicial + #816, #3967
  static telaInicial + #817, #3967
  static telaInicial + #818, #3967
  static telaInicial + #819, #3967
  static telaInicial + #820, #3967
  static telaInicial + #821, #3967
  static telaInicial + #822, #3967
  static telaInicial + #823, #3967
  static telaInicial + #824, #3967
  static telaInicial + #825, #3967
  static telaInicial + #826, #3967
  static telaInicial + #827, #3967
  static telaInicial + #828, #3967
  static telaInicial + #829, #3967
  static telaInicial + #830, #3967
  static telaInicial + #831, #3967
  static telaInicial + #832, #3967
  static telaInicial + #833, #3967
  static telaInicial + #834, #3967
  static telaInicial + #835, #3967
  static telaInicial + #836, #3967
  static telaInicial + #837, #3967
  static telaInicial + #838, #3967
  static telaInicial + #839, #3967

  ;Linha 21
  static telaInicial + #840, #3967
  static telaInicial + #841, #3967
  static telaInicial + #842, #3967
  static telaInicial + #843, #3967
  static telaInicial + #844, #3967
  static telaInicial + #845, #3967
  static telaInicial + #846, #3967
  static telaInicial + #847, #3967
  static telaInicial + #848, #3967
  static telaInicial + #849, #3967
  static telaInicial + #850, #3967
  static telaInicial + #851, #3967
  static telaInicial + #852, #3967
  static telaInicial + #853, #3967
  static telaInicial + #854, #3967
  static telaInicial + #855, #3967
  static telaInicial + #856, #3967
  static telaInicial + #857, #3967
  static telaInicial + #858, #3967
  static telaInicial + #859, #3967
  static telaInicial + #860, #3967
  static telaInicial + #861, #3967
  static telaInicial + #862, #3967
  static telaInicial + #863, #3967
  static telaInicial + #864, #3967
  static telaInicial + #865, #3967
  static telaInicial + #866, #3967
  static telaInicial + #867, #3967
  static telaInicial + #868, #3967
  static telaInicial + #869, #3967
  static telaInicial + #870, #3967
  static telaInicial + #871, #3967
  static telaInicial + #872, #3967
  static telaInicial + #873, #3967
  static telaInicial + #874, #3967
  static telaInicial + #875, #3967
  static telaInicial + #876, #3967
  static telaInicial + #877, #3967
  static telaInicial + #878, #3967
  static telaInicial + #879, #3967

  ;Linha 22
  static telaInicial + #880, #3967
  static telaInicial + #881, #3967
  static telaInicial + #882, #3967
  static telaInicial + #883, #3967
  static telaInicial + #884, #3967
  static telaInicial + #885, #3967
  static telaInicial + #886, #3967
  static telaInicial + #887, #3967
  static telaInicial + #888, #3967
  static telaInicial + #889, #3967
  static telaInicial + #890, #3967
  static telaInicial + #891, #3967
  static telaInicial + #892, #3967
  static telaInicial + #893, #3967
  static telaInicial + #894, #3967
  static telaInicial + #895, #3967
  static telaInicial + #896, #3967
  static telaInicial + #897, #3967
  static telaInicial + #898, #3967
  static telaInicial + #899, #3967
  static telaInicial + #900, #3967
  static telaInicial + #901, #3967
  static telaInicial + #902, #3967
  static telaInicial + #903, #3967
  static telaInicial + #904, #3967
  static telaInicial + #905, #3967
  static telaInicial + #906, #3967
  static telaInicial + #907, #3967
  static telaInicial + #908, #3967
  static telaInicial + #909, #3967
  static telaInicial + #910, #3967
  static telaInicial + #911, #3967
  static telaInicial + #912, #3967
  static telaInicial + #913, #3967
  static telaInicial + #914, #3967
  static telaInicial + #915, #3967
  static telaInicial + #916, #3967
  static telaInicial + #917, #3967
  static telaInicial + #918, #3967
  static telaInicial + #919, #3967

  ;Linha 23
  static telaInicial + #920, #3967
  static telaInicial + #921, #3967
  static telaInicial + #922, #3967
  static telaInicial + #923, #3967
  static telaInicial + #924, #3967
  static telaInicial + #925, #3967
  static telaInicial + #926, #3967
  static telaInicial + #927, #3967
  static telaInicial + #928, #3967
  static telaInicial + #929, #3967
  static telaInicial + #930, #3967
  static telaInicial + #931, #3967
  static telaInicial + #932, #3967
  static telaInicial + #933, #3967
  static telaInicial + #934, #3967
  static telaInicial + #935, #3967
  static telaInicial + #936, #3967
  static telaInicial + #937, #3967
  static telaInicial + #938, #3967
  static telaInicial + #939, #3967
  static telaInicial + #940, #3967
  static telaInicial + #941, #3967
  static telaInicial + #942, #3967
  static telaInicial + #943, #3967
  static telaInicial + #944, #3967
  static telaInicial + #945, #3967
  static telaInicial + #946, #3967
  static telaInicial + #947, #3967
  static telaInicial + #948, #3967
  static telaInicial + #949, #3967
  static telaInicial + #950, #3967
  static telaInicial + #951, #3967
  static telaInicial + #952, #3967
  static telaInicial + #953, #3967
  static telaInicial + #954, #3967
  static telaInicial + #955, #3967
  static telaInicial + #956, #3967
  static telaInicial + #957, #3967
  static telaInicial + #958, #3967
  static telaInicial + #959, #3967

  ;Linha 24
  static telaInicial + #960, #3967
  static telaInicial + #961, #3967
  static telaInicial + #962, #3967
  static telaInicial + #963, #3967
  static telaInicial + #964, #3967
  static telaInicial + #965, #3967
  static telaInicial + #966, #3967
  static telaInicial + #967, #3967
  static telaInicial + #968, #3967
  static telaInicial + #969, #3967
  static telaInicial + #970, #3967
  static telaInicial + #971, #3967
  static telaInicial + #972, #3967
  static telaInicial + #973, #3967
  static telaInicial + #974, #3967
  static telaInicial + #975, #3967
  static telaInicial + #976, #3967
  static telaInicial + #977, #3967
  static telaInicial + #978, #3967
  static telaInicial + #979, #3967
  static telaInicial + #980, #3967
  static telaInicial + #981, #3967
  static telaInicial + #982, #3967
  static telaInicial + #983, #3967
  static telaInicial + #984, #3967
  static telaInicial + #985, #3967
  static telaInicial + #986, #3967
  static telaInicial + #987, #3967
  static telaInicial + #988, #3967
  static telaInicial + #989, #3967
  static telaInicial + #990, #3967
  static telaInicial + #991, #3967
  static telaInicial + #992, #3967
  static telaInicial + #993, #3967
  static telaInicial + #994, #3967
  static telaInicial + #995, #3967
  static telaInicial + #996, #3967
  static telaInicial + #997, #3967
  static telaInicial + #998, #3967
  static telaInicial + #999, #3967

  ;Linha 25
  static telaInicial + #1000, #3967
  static telaInicial + #1001, #3967
  static telaInicial + #1002, #3967
  static telaInicial + #1003, #3967
  static telaInicial + #1004, #3967
  static telaInicial + #1005, #3967
  static telaInicial + #1006, #3967
  static telaInicial + #1007, #3967
  static telaInicial + #1008, #3967
  static telaInicial + #1009, #3967
  static telaInicial + #1010, #3967
  static telaInicial + #1011, #3967
  static telaInicial + #1012, #3967
  static telaInicial + #1013, #3967
  static telaInicial + #1014, #3967
  static telaInicial + #1015, #3967
  static telaInicial + #1016, #3967
  static telaInicial + #1017, #3967
  static telaInicial + #1018, #3967
  static telaInicial + #1019, #3967
  static telaInicial + #1020, #3967
  static telaInicial + #1021, #3967
  static telaInicial + #1022, #3967
  static telaInicial + #1023, #3967
  static telaInicial + #1024, #3967
  static telaInicial + #1025, #3967
  static telaInicial + #1026, #3967
  static telaInicial + #1027, #3967
  static telaInicial + #1028, #3967
  static telaInicial + #1029, #3967
  static telaInicial + #1030, #3967
  static telaInicial + #1031, #3967
  static telaInicial + #1032, #3967
  static telaInicial + #1033, #3967
  static telaInicial + #1034, #3967
  static telaInicial + #1035, #3967
  static telaInicial + #1036, #3967
  static telaInicial + #1037, #3967
  static telaInicial + #1038, #3967
  static telaInicial + #1039, #3967

  ;Linha 26
  static telaInicial + #1040, #3967
  static telaInicial + #1041, #3967
  static telaInicial + #1042, #3967
  static telaInicial + #1043, #3967
  static telaInicial + #1044, #3967
  static telaInicial + #1045, #3967
  static telaInicial + #1046, #3967
  static telaInicial + #1047, #3967
  static telaInicial + #1048, #3967
  static telaInicial + #1049, #3967
  static telaInicial + #1050, #3967
  static telaInicial + #1051, #3967
  static telaInicial + #1052, #3967
  static telaInicial + #1053, #3967
  static telaInicial + #1054, #3967
  static telaInicial + #1055, #3967
  static telaInicial + #1056, #3967
  static telaInicial + #1057, #3967
  static telaInicial + #1058, #3967
  static telaInicial + #1059, #3967
  static telaInicial + #1060, #3967
  static telaInicial + #1061, #3967
  static telaInicial + #1062, #3967
  static telaInicial + #1063, #3967
  static telaInicial + #1064, #3967
  static telaInicial + #1065, #3967
  static telaInicial + #1066, #3967
  static telaInicial + #1067, #3967
  static telaInicial + #1068, #3967
  static telaInicial + #1069, #3967
  static telaInicial + #1070, #3967
  static telaInicial + #1071, #3967
  static telaInicial + #1072, #3967
  static telaInicial + #1073, #3967
  static telaInicial + #1074, #3967
  static telaInicial + #1075, #3967
  static telaInicial + #1076, #3967
  static telaInicial + #1077, #3967
  static telaInicial + #1078, #3967
  static telaInicial + #1079, #3967

  ;Linha 27
  static telaInicial + #1080, #3967
  static telaInicial + #1081, #3967
  static telaInicial + #1082, #3967
  static telaInicial + #1083, #3967
  static telaInicial + #1084, #3967
  static telaInicial + #1085, #3967
  static telaInicial + #1086, #3967
  static telaInicial + #1087, #3967
  static telaInicial + #1088, #3967
  static telaInicial + #1089, #3967
  static telaInicial + #1090, #3967
  static telaInicial + #1091, #3967
  static telaInicial + #1092, #3967
  static telaInicial + #1093, #3967
  static telaInicial + #1094, #3967
  static telaInicial + #1095, #3967
  static telaInicial + #1096, #3967
  static telaInicial + #1097, #3967
  static telaInicial + #1098, #3967
  static telaInicial + #1099, #3967
  static telaInicial + #1100, #3967
  static telaInicial + #1101, #3967
  static telaInicial + #1102, #3967
  static telaInicial + #1103, #3967
  static telaInicial + #1104, #3967
  static telaInicial + #1105, #3967
  static telaInicial + #1106, #3967
  static telaInicial + #1107, #3967
  static telaInicial + #1108, #3967
  static telaInicial + #1109, #3967
  static telaInicial + #1110, #3967
  static telaInicial + #1111, #3967
  static telaInicial + #1112, #3967
  static telaInicial + #1113, #3967
  static telaInicial + #1114, #3967
  static telaInicial + #1115, #3967
  static telaInicial + #1116, #3967
  static telaInicial + #1117, #3967
  static telaInicial + #1118, #3967
  static telaInicial + #1119, #3967

  ;Linha 28
  static telaInicial + #1120, #3967
  static telaInicial + #1121, #3967
  static telaInicial + #1122, #3967
  static telaInicial + #1123, #3967
  static telaInicial + #1124, #3967
  static telaInicial + #1125, #3967
  static telaInicial + #1126, #3967
  static telaInicial + #1127, #3967
  static telaInicial + #1128, #3967
  static telaInicial + #1129, #3967
  static telaInicial + #1130, #3967
  static telaInicial + #1131, #3967
  static telaInicial + #1132, #3967
  static telaInicial + #1133, #3967
  static telaInicial + #1134, #3967
  static telaInicial + #1135, #3967
  static telaInicial + #1136, #3967
  static telaInicial + #1137, #3967
  static telaInicial + #1138, #3967
  static telaInicial + #1139, #3967
  static telaInicial + #1140, #3967
  static telaInicial + #1141, #3967
  static telaInicial + #1142, #3967
  static telaInicial + #1143, #3967
  static telaInicial + #1144, #3967
  static telaInicial + #1145, #3967
  static telaInicial + #1146, #3967
  static telaInicial + #1147, #3967
  static telaInicial + #1148, #3967
  static telaInicial + #1149, #3967
  static telaInicial + #1150, #3967
  static telaInicial + #1151, #3967
  static telaInicial + #1152, #3967
  static telaInicial + #1153, #3967
  static telaInicial + #1154, #3967
  static telaInicial + #1155, #3967
  static telaInicial + #1156, #3967
  static telaInicial + #1157, #3967
  static telaInicial + #1158, #3967
  static telaInicial + #1159, #3967

  ;Linha 29
  static telaInicial + #1160, #3967
  static telaInicial + #1161, #3967
  static telaInicial + #1162, #3967
  static telaInicial + #1163, #3967
  static telaInicial + #1164, #3967
  static telaInicial + #1165, #3967
  static telaInicial + #1166, #3967
  static telaInicial + #1167, #3967
  static telaInicial + #1168, #3967
  static telaInicial + #1169, #3967
  static telaInicial + #1170, #3967
  static telaInicial + #1171, #3967
  static telaInicial + #1172, #3967
  static telaInicial + #1173, #3967
  static telaInicial + #1174, #3967
  static telaInicial + #1175, #3967
  static telaInicial + #1176, #3967
  static telaInicial + #1177, #3967
  static telaInicial + #1178, #3967
  static telaInicial + #1179, #3967
  static telaInicial + #1180, #3967
  static telaInicial + #1181, #3967
  static telaInicial + #1182, #3967
  static telaInicial + #1183, #3967
  static telaInicial + #1184, #3967
  static telaInicial + #1185, #3967
  static telaInicial + #1186, #3967
  static telaInicial + #1187, #3967
  static telaInicial + #1188, #3967
  static telaInicial + #1189, #3967
  static telaInicial + #1190, #3967
  static telaInicial + #1191, #3967
  static telaInicial + #1192, #3967
  static telaInicial + #1193, #3967
  static telaInicial + #1194, #3967
  static telaInicial + #1195, #3967
  static telaInicial + #1196, #3967
  static telaInicial + #1197, #3967
  static telaInicial + #1198, #3967
  static telaInicial + #1199, #3967

teladeJogo : var #1200
  ;Linha 0
  static teladeJogo + #0, #127
  static teladeJogo + #1, #127
  static teladeJogo + #2, #127
  static teladeJogo + #3, #127
  static teladeJogo + #4, #127
  static teladeJogo + #5, #127
  static teladeJogo + #6, #127
  static teladeJogo + #7, #127
  static teladeJogo + #8, #771
  static teladeJogo + #9, #771
  static teladeJogo + #10, #771
  static teladeJogo + #11, #771
  static teladeJogo + #12, #771
  static teladeJogo + #13, #771
  static teladeJogo + #14, #771
  static teladeJogo + #15, #771
  static teladeJogo + #16, #771
  static teladeJogo + #17, #771
  static teladeJogo + #18, #771
  static teladeJogo + #19, #771
  static teladeJogo + #20, #771
  static teladeJogo + #21, #771
  static teladeJogo + #22, #771
  static teladeJogo + #23, #771
  static teladeJogo + #24, #771
  static teladeJogo + #25, #771
  static teladeJogo + #26, #771
  static teladeJogo + #27, #771
  static teladeJogo + #28, #771
  static teladeJogo + #29, #771
  static teladeJogo + #30, #771
  static teladeJogo + #31, #771
  static teladeJogo + #32, #771
  static teladeJogo + #33, #771
  static teladeJogo + #34, #127
  static teladeJogo + #35, #127
  static teladeJogo + #36, #127
  static teladeJogo + #37, #127
  static teladeJogo + #38, #127
  static teladeJogo + #39, #127

  ;Linha 1
  static teladeJogo + #40, #127
  static teladeJogo + #41, #127
  static teladeJogo + #42, #127
  static teladeJogo + #43, #127
  static teladeJogo + #44, #127
  static teladeJogo + #45, #127
  static teladeJogo + #46, #771
  static teladeJogo + #47, #771
  static teladeJogo + #48, #771
  static teladeJogo + #49, #127
  static teladeJogo + #50, #127
  static teladeJogo + #51, #127
  static teladeJogo + #52, #127
  static teladeJogo + #53, #127
  static teladeJogo + #54, #127
  static teladeJogo + #55, #127
  static teladeJogo + #56, #127
  static teladeJogo + #57, #127
  static teladeJogo + #58, #127
  static teladeJogo + #59, #127
  static teladeJogo + #60, #127
  static teladeJogo + #61, #127
  static teladeJogo + #62, #127
  static teladeJogo + #63, #127
  static teladeJogo + #64, #127
  static teladeJogo + #65, #127
  static teladeJogo + #66, #127
  static teladeJogo + #67, #127
  static teladeJogo + #68, #127
  static teladeJogo + #69, #127
  static teladeJogo + #70, #127
  static teladeJogo + #71, #127
  static teladeJogo + #72, #771
  static teladeJogo + #73, #771
  static teladeJogo + #74, #771
  static teladeJogo + #75, #771
  static teladeJogo + #76, #127
  static teladeJogo + #77, #127
  static teladeJogo + #78, #127
  static teladeJogo + #79, #127

  ;Linha 2
  static teladeJogo + #80, #127
  static teladeJogo + #81, #127
  static teladeJogo + #82, #127
  static teladeJogo + #83, #771
  static teladeJogo + #84, #771
  static teladeJogo + #85, #771
  static teladeJogo + #86, #771
  static teladeJogo + #87, #127
  static teladeJogo + #88, #127
  static teladeJogo + #89, #127
  static teladeJogo + #90, #127
  static teladeJogo + #91, #127
  static teladeJogo + #92, #127
  static teladeJogo + #93, #127
  static teladeJogo + #94, #127
  static teladeJogo + #95, #127
  static teladeJogo + #96, #127
  static teladeJogo + #97, #127
  static teladeJogo + #98, #127
  static teladeJogo + #99, #127
  static teladeJogo + #100, #127
  static teladeJogo + #101, #127
  static teladeJogo + #102, #127
  static teladeJogo + #103, #127
  static teladeJogo + #104, #127
  static teladeJogo + #105, #127
  static teladeJogo + #106, #127
  static teladeJogo + #107, #127
  static teladeJogo + #108, #127
  static teladeJogo + #109, #127
  static teladeJogo + #110, #127
  static teladeJogo + #111, #127
  static teladeJogo + #112, #127
  static teladeJogo + #113, #127
  static teladeJogo + #114, #127
  static teladeJogo + #115, #771
  static teladeJogo + #116, #771
  static teladeJogo + #117, #127
  static teladeJogo + #118, #127
  static teladeJogo + #119, #127

  ;Linha 3
  static teladeJogo + #120, #127
  static teladeJogo + #121, #127
  static teladeJogo + #122, #771
  static teladeJogo + #123, #771
  static teladeJogo + #124, #127
  static teladeJogo + #125, #127
  static teladeJogo + #126, #127
  static teladeJogo + #127, #127
  static teladeJogo + #128, #127
  static teladeJogo + #129, #127
  static teladeJogo + #130, #127
  static teladeJogo + #131, #127
  static teladeJogo + #132, #127
  static teladeJogo + #133, #127
  static teladeJogo + #134, #127
  static teladeJogo + #135, #127
  static teladeJogo + #136, #127
  static teladeJogo + #137, #127
  static teladeJogo + #138, #127
  static teladeJogo + #139, #127
  static teladeJogo + #140, #127
  static teladeJogo + #141, #127
  static teladeJogo + #142, #127
  static teladeJogo + #143, #127
  static teladeJogo + #144, #127
  static teladeJogo + #145, #127
  static teladeJogo + #146, #127
  static teladeJogo + #147, #127
  static teladeJogo + #148, #127
  static teladeJogo + #149, #127
  static teladeJogo + #150, #127
  static teladeJogo + #151, #127
  static teladeJogo + #152, #127
  static teladeJogo + #153, #127
  static teladeJogo + #154, #127
  static teladeJogo + #155, #127
  static teladeJogo + #156, #771
  static teladeJogo + #157, #771
  static teladeJogo + #158, #127
  static teladeJogo + #159, #127

  ;Linha 4
  static teladeJogo + #160, #771
  static teladeJogo + #161, #771
  static teladeJogo + #162, #771
  static teladeJogo + #163, #127
  static teladeJogo + #164, #127
  static teladeJogo + #165, #3967
  static teladeJogo + #166, #2819
  static teladeJogo + #167, #2819
  static teladeJogo + #168, #2819
  static teladeJogo + #169, #2819
  static teladeJogo + #170, #2819
  static teladeJogo + #171, #3967
  static teladeJogo + #172, #2819
  static teladeJogo + #173, #127
  static teladeJogo + #174, #127
  static teladeJogo + #175, #2819
  static teladeJogo + #176, #127
  static teladeJogo + #177, #127
  static teladeJogo + #178, #2819
  static teladeJogo + #179, #2819
  static teladeJogo + #180, #2819
  static teladeJogo + #181, #127
  static teladeJogo + #182, #127
  static teladeJogo + #183, #127
  static teladeJogo + #184, #2819
  static teladeJogo + #185, #2819
  static teladeJogo + #186, #2819
  static teladeJogo + #187, #127
  static teladeJogo + #188, #127
  static teladeJogo + #189, #2819
  static teladeJogo + #190, #2819
  static teladeJogo + #191, #2819
  static teladeJogo + #192, #127
  static teladeJogo + #193, #127
  static teladeJogo + #194, #127
  static teladeJogo + #195, #127
  static teladeJogo + #196, #771
  static teladeJogo + #197, #771
  static teladeJogo + #198, #771
  static teladeJogo + #199, #771

  ;Linha 5
  static teladeJogo + #200, #127
  static teladeJogo + #201, #127
  static teladeJogo + #202, #127
  static teladeJogo + #203, #127
  static teladeJogo + #204, #127
  static teladeJogo + #205, #127
  static teladeJogo + #206, #127
  static teladeJogo + #207, #127
  static teladeJogo + #208, #2819
  static teladeJogo + #209, #127
  static teladeJogo + #210, #127
  static teladeJogo + #211, #127
  static teladeJogo + #212, #2819
  static teladeJogo + #213, #127
  static teladeJogo + #214, #127
  static teladeJogo + #215, #2819
  static teladeJogo + #216, #127
  static teladeJogo + #217, #2819
  static teladeJogo + #218, #127
  static teladeJogo + #219, #127
  static teladeJogo + #220, #127
  static teladeJogo + #221, #127
  static teladeJogo + #222, #127
  static teladeJogo + #223, #2819
  static teladeJogo + #224, #3967
  static teladeJogo + #225, #127
  static teladeJogo + #226, #127
  static teladeJogo + #227, #127
  static teladeJogo + #228, #2819
  static teladeJogo + #229, #127
  static teladeJogo + #230, #127
  static teladeJogo + #231, #127
  static teladeJogo + #232, #2819
  static teladeJogo + #233, #127
  static teladeJogo + #234, #127
  static teladeJogo + #235, #127
  static teladeJogo + #236, #127
  static teladeJogo + #237, #127
  static teladeJogo + #238, #127
  static teladeJogo + #239, #127

  ;Linha 6
  static teladeJogo + #240, #127
  static teladeJogo + #241, #127
  static teladeJogo + #242, #127
  static teladeJogo + #243, #127
  static teladeJogo + #244, #127
  static teladeJogo + #245, #127
  static teladeJogo + #246, #127
  static teladeJogo + #247, #127
  static teladeJogo + #248, #2819
  static teladeJogo + #249, #127
  static teladeJogo + #250, #127
  static teladeJogo + #251, #127
  static teladeJogo + #252, #2819
  static teladeJogo + #253, #127
  static teladeJogo + #254, #127
  static teladeJogo + #255, #2819
  static teladeJogo + #256, #127
  static teladeJogo + #257, #2819
  static teladeJogo + #258, #127
  static teladeJogo + #259, #127
  static teladeJogo + #260, #127
  static teladeJogo + #261, #127
  static teladeJogo + #262, #127
  static teladeJogo + #263, #2819
  static teladeJogo + #264, #127
  static teladeJogo + #265, #127
  static teladeJogo + #266, #127
  static teladeJogo + #267, #127
  static teladeJogo + #268, #2819
  static teladeJogo + #269, #3967
  static teladeJogo + #270, #127
  static teladeJogo + #271, #127
  static teladeJogo + #272, #2819
  static teladeJogo + #273, #127
  static teladeJogo + #274, #127
  static teladeJogo + #275, #127
  static teladeJogo + #276, #127
  static teladeJogo + #277, #127
  static teladeJogo + #278, #127
  static teladeJogo + #279, #127

  ;Linha 7
  static teladeJogo + #280, #127
  static teladeJogo + #281, #127
  static teladeJogo + #282, #127
  static teladeJogo + #283, #127
  static teladeJogo + #284, #127
  static teladeJogo + #285, #127
  static teladeJogo + #286, #127
  static teladeJogo + #287, #127
  static teladeJogo + #288, #2819
  static teladeJogo + #289, #127
  static teladeJogo + #290, #127
  static teladeJogo + #291, #127
  static teladeJogo + #292, #2819
  static teladeJogo + #293, #127
  static teladeJogo + #294, #127
  static teladeJogo + #295, #2819
  static teladeJogo + #296, #127
  static teladeJogo + #297, #127
  static teladeJogo + #298, #2819
  static teladeJogo + #299, #2819
  static teladeJogo + #300, #127
  static teladeJogo + #301, #127
  static teladeJogo + #302, #127
  static teladeJogo + #303, #2819
  static teladeJogo + #304, #127
  static teladeJogo + #305, #127
  static teladeJogo + #306, #127
  static teladeJogo + #307, #127
  static teladeJogo + #308, #2819
  static teladeJogo + #309, #127
  static teladeJogo + #310, #127
  static teladeJogo + #311, #127
  static teladeJogo + #312, #2819
  static teladeJogo + #313, #127
  static teladeJogo + #314, #127
  static teladeJogo + #315, #127
  static teladeJogo + #316, #127
  static teladeJogo + #317, #127
  static teladeJogo + #318, #127
  static teladeJogo + #319, #127

  ;Linha 8
  static teladeJogo + #320, #127
  static teladeJogo + #321, #127
  static teladeJogo + #322, #127
  static teladeJogo + #323, #127
  static teladeJogo + #324, #127
  static teladeJogo + #325, #127
  static teladeJogo + #326, #127
  static teladeJogo + #327, #127
  static teladeJogo + #328, #2819
  static teladeJogo + #329, #127
  static teladeJogo + #330, #127
  static teladeJogo + #331, #127
  static teladeJogo + #332, #2819
  static teladeJogo + #333, #127
  static teladeJogo + #334, #127
  static teladeJogo + #335, #2819
  static teladeJogo + #336, #127
  static teladeJogo + #337, #127
  static teladeJogo + #338, #127
  static teladeJogo + #339, #127
  static teladeJogo + #340, #2819
  static teladeJogo + #341, #127
  static teladeJogo + #342, #127
  static teladeJogo + #343, #2819
  static teladeJogo + #344, #127
  static teladeJogo + #345, #127
  static teladeJogo + #346, #127
  static teladeJogo + #347, #127
  static teladeJogo + #348, #2819
  static teladeJogo + #349, #2819
  static teladeJogo + #350, #2819
  static teladeJogo + #351, #2819
  static teladeJogo + #352, #2819
  static teladeJogo + #353, #127
  static teladeJogo + #354, #127
  static teladeJogo + #355, #127
  static teladeJogo + #356, #127
  static teladeJogo + #357, #127
  static teladeJogo + #358, #127
  static teladeJogo + #359, #127

  ;Linha 9
  static teladeJogo + #360, #127
  static teladeJogo + #361, #127
  static teladeJogo + #362, #127
  static teladeJogo + #363, #127
  static teladeJogo + #364, #127
  static teladeJogo + #365, #127
  static teladeJogo + #366, #127
  static teladeJogo + #367, #127
  static teladeJogo + #368, #2819
  static teladeJogo + #369, #127
  static teladeJogo + #370, #127
  static teladeJogo + #371, #127
  static teladeJogo + #372, #127
  static teladeJogo + #373, #2819
  static teladeJogo + #374, #2819
  static teladeJogo + #375, #127
  static teladeJogo + #376, #127
  static teladeJogo + #377, #127
  static teladeJogo + #378, #127
  static teladeJogo + #379, #127
  static teladeJogo + #380, #2819
  static teladeJogo + #381, #127
  static teladeJogo + #382, #127
  static teladeJogo + #383, #2819
  static teladeJogo + #384, #127
  static teladeJogo + #385, #127
  static teladeJogo + #386, #127
  static teladeJogo + #387, #127
  static teladeJogo + #388, #2819
  static teladeJogo + #389, #3967
  static teladeJogo + #390, #3967
  static teladeJogo + #391, #3967
  static teladeJogo + #392, #2819
  static teladeJogo + #393, #127
  static teladeJogo + #394, #127
  static teladeJogo + #395, #127
  static teladeJogo + #396, #127
  static teladeJogo + #397, #127
  static teladeJogo + #398, #127
  static teladeJogo + #399, #127

  ;Linha 10
  static teladeJogo + #400, #127
  static teladeJogo + #401, #127
  static teladeJogo + #402, #127
  static teladeJogo + #403, #127
  static teladeJogo + #404, #127
  static teladeJogo + #405, #127
  static teladeJogo + #406, #127
  static teladeJogo + #407, #127
  static teladeJogo + #408, #127
  static teladeJogo + #409, #127
  static teladeJogo + #410, #127
  static teladeJogo + #411, #127
  static teladeJogo + #412, #127
  static teladeJogo + #413, #127
  static teladeJogo + #414, #127
  static teladeJogo + #415, #127
  static teladeJogo + #416, #127
  static teladeJogo + #417, #2819
  static teladeJogo + #418, #2819
  static teladeJogo + #419, #2819
  static teladeJogo + #420, #3967
  static teladeJogo + #421, #127
  static teladeJogo + #422, #127
  static teladeJogo + #423, #127
  static teladeJogo + #424, #2819
  static teladeJogo + #425, #2819
  static teladeJogo + #426, #2819
  static teladeJogo + #427, #127
  static teladeJogo + #428, #2819
  static teladeJogo + #429, #3967
  static teladeJogo + #430, #127
  static teladeJogo + #431, #127
  static teladeJogo + #432, #2819
  static teladeJogo + #433, #127
  static teladeJogo + #434, #127
  static teladeJogo + #435, #127
  static teladeJogo + #436, #127
  static teladeJogo + #437, #127
  static teladeJogo + #438, #127
  static teladeJogo + #439, #127

  ;Linha 11
  static teladeJogo + #440, #127
  static teladeJogo + #441, #127
  static teladeJogo + #442, #127
  static teladeJogo + #443, #127
  static teladeJogo + #444, #127
  static teladeJogo + #445, #127
  static teladeJogo + #446, #127
  static teladeJogo + #447, #127
  static teladeJogo + #448, #127
  static teladeJogo + #449, #127
  static teladeJogo + #450, #127
  static teladeJogo + #451, #127
  static teladeJogo + #452, #127
  static teladeJogo + #453, #127
  static teladeJogo + #454, #127
  static teladeJogo + #455, #127
  static teladeJogo + #456, #127
  static teladeJogo + #457, #127
  static teladeJogo + #458, #127
  static teladeJogo + #459, #127
  static teladeJogo + #460, #127
  static teladeJogo + #461, #127
  static teladeJogo + #462, #127
  static teladeJogo + #463, #127
  static teladeJogo + #464, #127
  static teladeJogo + #465, #127
  static teladeJogo + #466, #127
  static teladeJogo + #467, #127
  static teladeJogo + #468, #127
  static teladeJogo + #469, #127
  static teladeJogo + #470, #127
  static teladeJogo + #471, #127
  static teladeJogo + #472, #127
  static teladeJogo + #473, #127
  static teladeJogo + #474, #127
  static teladeJogo + #475, #127
  static teladeJogo + #476, #127
  static teladeJogo + #477, #127
  static teladeJogo + #478, #127
  static teladeJogo + #479, #127

  ;Linha 12
  static teladeJogo + #480, #127
  static teladeJogo + #481, #127
  static teladeJogo + #482, #127
  static teladeJogo + #483, #127
  static teladeJogo + #484, #127
  static teladeJogo + #485, #127
  static teladeJogo + #486, #127
  static teladeJogo + #487, #127
  static teladeJogo + #488, #127
  static teladeJogo + #489, #127
  static teladeJogo + #490, #127
  static teladeJogo + #491, #127
  static teladeJogo + #492, #127
  static teladeJogo + #493, #127
  static teladeJogo + #494, #127
  static teladeJogo + #495, #127
  static teladeJogo + #496, #127
  static teladeJogo + #497, #127
  static teladeJogo + #498, #127
  static teladeJogo + #499, #127
  static teladeJogo + #500, #127
  static teladeJogo + #501, #127
  static teladeJogo + #502, #127
  static teladeJogo + #503, #127
  static teladeJogo + #504, #127
  static teladeJogo + #505, #127
  static teladeJogo + #506, #127
  static teladeJogo + #507, #127
  static teladeJogo + #508, #127
  static teladeJogo + #509, #127
  static teladeJogo + #510, #127
  static teladeJogo + #511, #127
  static teladeJogo + #512, #127
  static teladeJogo + #513, #127
  static teladeJogo + #514, #127
  static teladeJogo + #515, #127
  static teladeJogo + #516, #127
  static teladeJogo + #517, #127
  static teladeJogo + #518, #127
  static teladeJogo + #519, #127

  ;Linha 13
  static teladeJogo + #520, #771
  static teladeJogo + #521, #771
  static teladeJogo + #522, #771
  static teladeJogo + #523, #771
  static teladeJogo + #524, #771
  static teladeJogo + #525, #771
  static teladeJogo + #526, #771
  static teladeJogo + #527, #771
  static teladeJogo + #528, #771
  static teladeJogo + #529, #771
  static teladeJogo + #530, #771
  static teladeJogo + #531, #771
  static teladeJogo + #532, #771
  static teladeJogo + #533, #771
  static teladeJogo + #534, #771
  static teladeJogo + #535, #771
  static teladeJogo + #536, #771
  static teladeJogo + #537, #771
  static teladeJogo + #538, #771
  static teladeJogo + #539, #771
  static teladeJogo + #540, #771
  static teladeJogo + #541, #771
  static teladeJogo + #542, #771
  static teladeJogo + #543, #771
  static teladeJogo + #544, #771
  static teladeJogo + #545, #771
  static teladeJogo + #546, #771
  static teladeJogo + #547, #771
  static teladeJogo + #548, #771
  static teladeJogo + #549, #771
  static teladeJogo + #550, #771
  static teladeJogo + #551, #771
  static teladeJogo + #552, #771
  static teladeJogo + #553, #771
  static teladeJogo + #554, #771
  static teladeJogo + #555, #771
  static teladeJogo + #556, #771
  static teladeJogo + #557, #771
  static teladeJogo + #558, #771
  static teladeJogo + #559, #771

  ;Linha 14
  static teladeJogo + #560, #127
  static teladeJogo + #561, #127
  static teladeJogo + #562, #127
  static teladeJogo + #563, #127
  static teladeJogo + #564, #127
  static teladeJogo + #565, #127
  static teladeJogo + #566, #127
  static teladeJogo + #567, #127
  static teladeJogo + #568, #127
  static teladeJogo + #569, #127
  static teladeJogo + #570, #127
  static teladeJogo + #571, #771
  static teladeJogo + #572, #127
  static teladeJogo + #573, #127
  static teladeJogo + #574, #127
  static teladeJogo + #575, #127
  static teladeJogo + #576, #127
  static teladeJogo + #577, #127
  static teladeJogo + #578, #127
  static teladeJogo + #579, #127
  static teladeJogo + #580, #127
  static teladeJogo + #581, #127
  static teladeJogo + #582, #127
  static teladeJogo + #583, #127
  static teladeJogo + #584, #127
  static teladeJogo + #585, #771
  static teladeJogo + #586, #127
  static teladeJogo + #587, #127
  static teladeJogo + #588, #127
  static teladeJogo + #589, #127
  static teladeJogo + #590, #127
  static teladeJogo + #591, #127
  static teladeJogo + #592, #127
  static teladeJogo + #593, #127
  static teladeJogo + #594, #127
  static teladeJogo + #595, #127
  static teladeJogo + #596, #127
  static teladeJogo + #597, #127
  static teladeJogo + #598, #127
  static teladeJogo + #599, #127

  ;Linha 15
  static teladeJogo + #600, #127
  static teladeJogo + #601, #127
  static teladeJogo + #602, #127
  static teladeJogo + #603, #127
  static teladeJogo + #604, #127
  static teladeJogo + #605, #127
  static teladeJogo + #606, #127
  static teladeJogo + #607, #127
  static teladeJogo + #608, #127
  static teladeJogo + #609, #127
  static teladeJogo + #610, #127
  static teladeJogo + #611, #771
  static teladeJogo + #612, #127
  static teladeJogo + #613, #127
  static teladeJogo + #614, #127
  static teladeJogo + #615, #127
  static teladeJogo + #616, #127
  static teladeJogo + #617, #127
  static teladeJogo + #618, #127
  static teladeJogo + #619, #127
  static teladeJogo + #620, #127
  static teladeJogo + #621, #127
  static teladeJogo + #622, #127
  static teladeJogo + #623, #127
  static teladeJogo + #624, #127
  static teladeJogo + #625, #771
  static teladeJogo + #626, #127
  static teladeJogo + #627, #127
  static teladeJogo + #628, #127
  static teladeJogo + #629, #127
  static teladeJogo + #630, #127
  static teladeJogo + #631, #127
  static teladeJogo + #632, #127
  static teladeJogo + #633, #127
  static teladeJogo + #634, #127
  static teladeJogo + #635, #127
  static teladeJogo + #636, #127
  static teladeJogo + #637, #127
  static teladeJogo + #638, #127
  static teladeJogo + #639, #127

  ;Linha 16
  static teladeJogo + #640, #127
  static teladeJogo + #641, #259
  static teladeJogo + #642, #127
  static teladeJogo + #643, #127
  static teladeJogo + #644, #127
  static teladeJogo + #645, #127
  static teladeJogo + #646, #127
  static teladeJogo + #647, #127
  static teladeJogo + #648, #259
  static teladeJogo + #649, #127
  static teladeJogo + #650, #127
  static teladeJogo + #651, #771
  static teladeJogo + #652, #127
  static teladeJogo + #653, #127
  static teladeJogo + #654, #127
  static teladeJogo + #655, #127
  static teladeJogo + #656, #127
  static teladeJogo + #657, #127
  static teladeJogo + #658, #127
  static teladeJogo + #659, #127
  static teladeJogo + #660, #127
  static teladeJogo + #661, #127
  static teladeJogo + #662, #127
  static teladeJogo + #663, #127
  static teladeJogo + #664, #127
  static teladeJogo + #665, #771
  static teladeJogo + #666, #127
  static teladeJogo + #667, #127
  static teladeJogo + #668, #259
  static teladeJogo + #669, #127
  static teladeJogo + #670, #127
  static teladeJogo + #671, #127
  static teladeJogo + #672, #127
  static teladeJogo + #673, #127
  static teladeJogo + #674, #127
  static teladeJogo + #675, #259
  static teladeJogo + #676, #127
  static teladeJogo + #677, #127
  static teladeJogo + #678, #127
  static teladeJogo + #679, #127

  ;Linha 17
  static teladeJogo + #680, #127
  static teladeJogo + #681, #3967
  static teladeJogo + #682, #127
  static teladeJogo + #683, #259
  static teladeJogo + #684, #127
  static teladeJogo + #685, #259
  static teladeJogo + #686, #127
  static teladeJogo + #687, #127
  static teladeJogo + #688, #127
  static teladeJogo + #689, #127
  static teladeJogo + #690, #127
  static teladeJogo + #691, #771
  static teladeJogo + #692, #127
  static teladeJogo + #693, #127
  static teladeJogo + #694, #127
  static teladeJogo + #695, #127
  static teladeJogo + #696, #127
  static teladeJogo + #697, #127
  static teladeJogo + #698, #127
  static teladeJogo + #699, #127
  static teladeJogo + #700, #127
  static teladeJogo + #701, #127
  static teladeJogo + #702, #127
  static teladeJogo + #703, #127
  static teladeJogo + #704, #127
  static teladeJogo + #705, #771
  static teladeJogo + #706, #127
  static teladeJogo + #707, #127
  static teladeJogo + #708, #127
  static teladeJogo + #709, #127
  static teladeJogo + #710, #127
  static teladeJogo + #711, #127
  static teladeJogo + #712, #127
  static teladeJogo + #713, #127
  static teladeJogo + #714, #127
  static teladeJogo + #715, #127
  static teladeJogo + #716, #127
  static teladeJogo + #717, #127
  static teladeJogo + #718, #127
  static teladeJogo + #719, #127

  ;Linha 18
  static teladeJogo + #720, #127
  static teladeJogo + #721, #3967
  static teladeJogo + #722, #127
  static teladeJogo + #723, #127
  static teladeJogo + #724, #127
  static teladeJogo + #725, #127
  static teladeJogo + #726, #127
  static teladeJogo + #727, #127
  static teladeJogo + #728, #127
  static teladeJogo + #729, #127
  static teladeJogo + #730, #127
  static teladeJogo + #731, #771
  static teladeJogo + #732, #127
  static teladeJogo + #733, #127
  static teladeJogo + #734, #127
  static teladeJogo + #735, #127
  static teladeJogo + #736, #127
  static teladeJogo + #737, #127
  static teladeJogo + #738, #127
  static teladeJogo + #739, #127
  static teladeJogo + #740, #127
  static teladeJogo + #741, #127
  static teladeJogo + #742, #127
  static teladeJogo + #743, #127
  static teladeJogo + #744, #127
  static teladeJogo + #745, #771
  static teladeJogo + #746, #127
  static teladeJogo + #747, #127
  static teladeJogo + #748, #127
  static teladeJogo + #749, #127
  static teladeJogo + #750, #127
  static teladeJogo + #751, #127
  static teladeJogo + #752, #259
  static teladeJogo + #753, #127
  static teladeJogo + #754, #127
  static teladeJogo + #755, #127
  static teladeJogo + #756, #127
  static teladeJogo + #757, #127
  static teladeJogo + #758, #127
  static teladeJogo + #759, #127

  ;Linha 19
  static teladeJogo + #760, #127
  static teladeJogo + #761, #3967
  static teladeJogo + #762, #3967
  static teladeJogo + #763, #259
  static teladeJogo + #764, #127
  static teladeJogo + #765, #259
  static teladeJogo + #766, #127
  static teladeJogo + #767, #127
  static teladeJogo + #768, #127
  static teladeJogo + #769, #127
  static teladeJogo + #770, #127
  static teladeJogo + #771, #771
  static teladeJogo + #772, #127
  static teladeJogo + #773, #127
  static teladeJogo + #774, #127
  static teladeJogo + #775, #127
  static teladeJogo + #776, #127
  static teladeJogo + #777, #127
  static teladeJogo + #778, #127
  static teladeJogo + #779, #127
  static teladeJogo + #780, #127
  static teladeJogo + #781, #127
  static teladeJogo + #782, #127
  static teladeJogo + #783, #127
  static teladeJogo + #784, #3967
  static teladeJogo + #785, #771
  static teladeJogo + #786, #127
  static teladeJogo + #787, #127
  static teladeJogo + #788, #127
  static teladeJogo + #789, #127
  static teladeJogo + #790, #127
  static teladeJogo + #791, #127
  static teladeJogo + #792, #127
  static teladeJogo + #793, #127
  static teladeJogo + #794, #127
  static teladeJogo + #795, #259
  static teladeJogo + #796, #127
  static teladeJogo + #797, #127
  static teladeJogo + #798, #127
  static teladeJogo + #799, #127

  ;Linha 20
  static teladeJogo + #800, #127
  static teladeJogo + #801, #127
  static teladeJogo + #802, #127
  static teladeJogo + #803, #127
  static teladeJogo + #804, #127
  static teladeJogo + #805, #127
  static teladeJogo + #806, #127
  static teladeJogo + #807, #259
  static teladeJogo + #808, #127
  static teladeJogo + #809, #127
  static teladeJogo + #810, #127
  static teladeJogo + #811, #771
  static teladeJogo + #812, #127
  static teladeJogo + #813, #127
  static teladeJogo + #814, #127
  static teladeJogo + #815, #127
  static teladeJogo + #816, #127
  static teladeJogo + #817, #127
  static teladeJogo + #818, #127
  static teladeJogo + #819, #127
  static teladeJogo + #820, #127
  static teladeJogo + #821, #127
  static teladeJogo + #822, #127
  static teladeJogo + #823, #127
  static teladeJogo + #824, #3967
  static teladeJogo + #825, #771
  static teladeJogo + #826, #127
  static teladeJogo + #827, #127
  static teladeJogo + #828, #127
  static teladeJogo + #829, #127
  static teladeJogo + #830, #259
  static teladeJogo + #831, #127
  static teladeJogo + #832, #127
  static teladeJogo + #833, #127
  static teladeJogo + #834, #127
  static teladeJogo + #835, #127
  static teladeJogo + #836, #127
  static teladeJogo + #837, #127
  static teladeJogo + #838, #127
  static teladeJogo + #839, #127

  ;Linha 21
  static teladeJogo + #840, #127
  static teladeJogo + #841, #127
  static teladeJogo + #842, #127
  static teladeJogo + #843, #127
  static teladeJogo + #844, #127
  static teladeJogo + #845, #127
  static teladeJogo + #846, #127
  static teladeJogo + #847, #127
  static teladeJogo + #848, #127
  static teladeJogo + #849, #127
  static teladeJogo + #850, #127
  static teladeJogo + #851, #771
  static teladeJogo + #852, #127
  static teladeJogo + #853, #127
  static teladeJogo + #854, #127
  static teladeJogo + #855, #127
  static teladeJogo + #856, #127
  static teladeJogo + #857, #127
  static teladeJogo + #858, #127
  static teladeJogo + #859, #127
  static teladeJogo + #860, #127
  static teladeJogo + #861, #127
  static teladeJogo + #862, #127
  static teladeJogo + #863, #127
  static teladeJogo + #864, #3967
  static teladeJogo + #865, #771
  static teladeJogo + #866, #127
  static teladeJogo + #867, #127
  static teladeJogo + #868, #259
  static teladeJogo + #869, #127
  static teladeJogo + #870, #127
  static teladeJogo + #871, #127
  static teladeJogo + #872, #127
  static teladeJogo + #873, #127
  static teladeJogo + #874, #127
  static teladeJogo + #875, #127
  static teladeJogo + #876, #127
  static teladeJogo + #877, #127
  static teladeJogo + #878, #127
  static teladeJogo + #879, #127

  ;Linha 22
  static teladeJogo + #880, #127
  static teladeJogo + #881, #127
  static teladeJogo + #882, #127
  static teladeJogo + #883, #127
  static teladeJogo + #884, #259
  static teladeJogo + #885, #3967
  static teladeJogo + #886, #127
  static teladeJogo + #887, #127
  static teladeJogo + #888, #127
  static teladeJogo + #889, #127
  static teladeJogo + #890, #127
  static teladeJogo + #891, #771
  static teladeJogo + #892, #127
  static teladeJogo + #893, #127
  static teladeJogo + #894, #127
  static teladeJogo + #895, #127
  static teladeJogo + #896, #127
  static teladeJogo + #897, #127
  static teladeJogo + #898, #127
  static teladeJogo + #899, #127
  static teladeJogo + #900, #127
  static teladeJogo + #901, #127
  static teladeJogo + #902, #127
  static teladeJogo + #903, #127
  static teladeJogo + #904, #3967
  static teladeJogo + #905, #771
  static teladeJogo + #906, #127
  static teladeJogo + #907, #127
  static teladeJogo + #908, #127
  static teladeJogo + #909, #127
  static teladeJogo + #910, #127
  static teladeJogo + #911, #127
  static teladeJogo + #912, #127
  static teladeJogo + #913, #127
  static teladeJogo + #914, #127
  static teladeJogo + #915, #127
  static teladeJogo + #916, #127
  static teladeJogo + #917, #127
  static teladeJogo + #918, #127
  static teladeJogo + #919, #127

  ;Linha 23
  static teladeJogo + #920, #127
  static teladeJogo + #921, #127
  static teladeJogo + #922, #127
  static teladeJogo + #923, #127
  static teladeJogo + #924, #127
  static teladeJogo + #925, #127
  static teladeJogo + #926, #259
  static teladeJogo + #927, #127
  static teladeJogo + #928, #127
  static teladeJogo + #929, #127
  static teladeJogo + #930, #127
  static teladeJogo + #931, #771
  static teladeJogo + #932, #127
  static teladeJogo + #933, #127
  static teladeJogo + #934, #127
  static teladeJogo + #935, #127
  static teladeJogo + #936, #127
  static teladeJogo + #937, #127
  static teladeJogo + #938, #127
  static teladeJogo + #939, #127
  static teladeJogo + #940, #127
  static teladeJogo + #941, #127
  static teladeJogo + #942, #127
  static teladeJogo + #943, #127
  static teladeJogo + #944, #127
  static teladeJogo + #945, #771
  static teladeJogo + #946, #127
  static teladeJogo + #947, #127
  static teladeJogo + #948, #127
  static teladeJogo + #949, #127
  static teladeJogo + #950, #127
  static teladeJogo + #951, #127
  static teladeJogo + #952, #127
  static teladeJogo + #953, #127
  static teladeJogo + #954, #259
  static teladeJogo + #955, #127
  static teladeJogo + #956, #127
  static teladeJogo + #957, #127
  static teladeJogo + #958, #127
  static teladeJogo + #959, #127

  ;Linha 24
  static teladeJogo + #960, #127
  static teladeJogo + #961, #127
  static teladeJogo + #962, #127
  static teladeJogo + #963, #127
  static teladeJogo + #964, #127
  static teladeJogo + #965, #127
  static teladeJogo + #966, #127
  static teladeJogo + #967, #3967
  static teladeJogo + #968, #127
  static teladeJogo + #969, #127
  static teladeJogo + #970, #127
  static teladeJogo + #971, #771
  static teladeJogo + #972, #127
  static teladeJogo + #973, #127
  static teladeJogo + #974, #127
  static teladeJogo + #975, #127
  static teladeJogo + #976, #127
  static teladeJogo + #977, #127
  static teladeJogo + #978, #127
  static teladeJogo + #979, #127
  static teladeJogo + #980, #127
  static teladeJogo + #981, #127
  static teladeJogo + #982, #127
  static teladeJogo + #983, #127
  static teladeJogo + #984, #127
  static teladeJogo + #985, #771
  static teladeJogo + #986, #127
  static teladeJogo + #987, #127
  static teladeJogo + #988, #127
  static teladeJogo + #989, #127
  static teladeJogo + #990, #127
  static teladeJogo + #991, #259
  static teladeJogo + #992, #127
  static teladeJogo + #993, #127
  static teladeJogo + #994, #127
  static teladeJogo + #995, #127
  static teladeJogo + #996, #127
  static teladeJogo + #997, #127
  static teladeJogo + #998, #127
  static teladeJogo + #999, #127

  ;Linha 25
  static teladeJogo + #1000, #127
  static teladeJogo + #1001, #259
  static teladeJogo + #1002, #127
  static teladeJogo + #1003, #127
  static teladeJogo + #1004, #127
  static teladeJogo + #1005, #127
  static teladeJogo + #1006, #3967
  static teladeJogo + #1007, #127
  static teladeJogo + #1008, #127
  static teladeJogo + #1009, #127
  static teladeJogo + #1010, #127
  static teladeJogo + #1011, #771
  static teladeJogo + #1012, #127
  static teladeJogo + #1013, #127
  static teladeJogo + #1014, #127
  static teladeJogo + #1015, #127
  static teladeJogo + #1016, #127
  static teladeJogo + #1017, #127
  static teladeJogo + #1018, #127
  static teladeJogo + #1019, #127
  static teladeJogo + #1020, #127
  static teladeJogo + #1021, #127
  static teladeJogo + #1022, #127
  static teladeJogo + #1023, #127
  static teladeJogo + #1024, #127
  static teladeJogo + #1025, #771
  static teladeJogo + #1026, #127
  static teladeJogo + #1027, #127
  static teladeJogo + #1028, #127
  static teladeJogo + #1029, #259
  static teladeJogo + #1030, #127
  static teladeJogo + #1031, #127
  static teladeJogo + #1032, #127
  static teladeJogo + #1033, #127
  static teladeJogo + #1034, #127
  static teladeJogo + #1035, #127
  static teladeJogo + #1036, #127
  static teladeJogo + #1037, #127
  static teladeJogo + #1038, #127
  static teladeJogo + #1039, #127

  ;Linha 26
  static teladeJogo + #1040, #127
  static teladeJogo + #1041, #3967
  static teladeJogo + #1042, #3967
  static teladeJogo + #1043, #127
  static teladeJogo + #1044, #127
  static teladeJogo + #1045, #3967
  static teladeJogo + #1046, #3967
  static teladeJogo + #1047, #127
  static teladeJogo + #1048, #127
  static teladeJogo + #1049, #127
  static teladeJogo + #1050, #127
  static teladeJogo + #1051, #771
  static teladeJogo + #1052, #127
  static teladeJogo + #1053, #127
  static teladeJogo + #1054, #127
  static teladeJogo + #1055, #127
  static teladeJogo + #1056, #127
  static teladeJogo + #1057, #127
  static teladeJogo + #1058, #127
  static teladeJogo + #1059, #127
  static teladeJogo + #1060, #127
  static teladeJogo + #1061, #127
  static teladeJogo + #1062, #127
  static teladeJogo + #1063, #127
  static teladeJogo + #1064, #127
  static teladeJogo + #1065, #771
  static teladeJogo + #1066, #127
  static teladeJogo + #1067, #127
  static teladeJogo + #1068, #127
  static teladeJogo + #1069, #127
  static teladeJogo + #1070, #127
  static teladeJogo + #1071, #127
  static teladeJogo + #1072, #127
  static teladeJogo + #1073, #127
  static teladeJogo + #1074, #127
  static teladeJogo + #1075, #127
  static teladeJogo + #1076, #127
  static teladeJogo + #1077, #127
  static teladeJogo + #1078, #127
  static teladeJogo + #1079, #127

  ;Linha 27
  static teladeJogo + #1080, #127
  static teladeJogo + #1081, #127
  static teladeJogo + #1082, #127
  static teladeJogo + #1083, #127
  static teladeJogo + #1084, #127
  static teladeJogo + #1085, #127
  static teladeJogo + #1086, #127
  static teladeJogo + #1087, #127
  static teladeJogo + #1088, #127
  static teladeJogo + #1089, #127
  static teladeJogo + #1090, #127
  static teladeJogo + #1091, #771
  static teladeJogo + #1092, #127
  static teladeJogo + #1093, #127
  static teladeJogo + #1094, #127
  static teladeJogo + #1095, #127
  static teladeJogo + #1096, #127
  static teladeJogo + #1097, #127
  static teladeJogo + #1098, #127
  static teladeJogo + #1099, #127
  static teladeJogo + #1100, #127
  static teladeJogo + #1101, #127
  static teladeJogo + #1102, #127
  static teladeJogo + #1103, #127
  static teladeJogo + #1104, #127
  static teladeJogo + #1105, #771
  static teladeJogo + #1106, #127
  static teladeJogo + #1107, #127
  static teladeJogo + #1108, #127
  static teladeJogo + #1109, #127
  static teladeJogo + #1110, #127
  static teladeJogo + #1111, #127
  static teladeJogo + #1112, #127
  static teladeJogo + #1113, #127
  static teladeJogo + #1114, #127
  static teladeJogo + #1115, #127
  static teladeJogo + #1116, #127
  static teladeJogo + #1117, #259
  static teladeJogo + #1118, #127
  static teladeJogo + #1119, #127

  ;Linha 28
  static teladeJogo + #1120, #127
  static teladeJogo + #1121, #127
  static teladeJogo + #1122, #127
  static teladeJogo + #1123, #127
  static teladeJogo + #1124, #127
  static teladeJogo + #1125, #127
  static teladeJogo + #1126, #127
  static teladeJogo + #1127, #127
  static teladeJogo + #1128, #127
  static teladeJogo + #1129, #127
  static teladeJogo + #1130, #127
  static teladeJogo + #1131, #771
  static teladeJogo + #1132, #127
  static teladeJogo + #1133, #127
  static teladeJogo + #1134, #127
  static teladeJogo + #1135, #127
  static teladeJogo + #1136, #127
  static teladeJogo + #1137, #127
  static teladeJogo + #1138, #127
  static teladeJogo + #1139, #127
  static teladeJogo + #1140, #127
  static teladeJogo + #1141, #127
  static teladeJogo + #1142, #127
  static teladeJogo + #1143, #127
  static teladeJogo + #1144, #127
  static teladeJogo + #1145, #771
  static teladeJogo + #1146, #127
  static teladeJogo + #1147, #127
  static teladeJogo + #1148, #127
  static teladeJogo + #1149, #127
  static teladeJogo + #1150, #127
  static teladeJogo + #1151, #127
  static teladeJogo + #1152, #127
  static teladeJogo + #1153, #127
  static teladeJogo + #1154, #127
  static teladeJogo + #1155, #127
  static teladeJogo + #1156, #127
  static teladeJogo + #1157, #127
  static teladeJogo + #1158, #127
  static teladeJogo + #1159, #127

  ;Linha 29
  static teladeJogo + #1160, #127
  static teladeJogo + #1161, #127
  static teladeJogo + #1162, #127
  static teladeJogo + #1163, #127
  static teladeJogo + #1164, #127
  static teladeJogo + #1165, #127
  static teladeJogo + #1166, #127
  static teladeJogo + #1167, #127
  static teladeJogo + #1168, #127
  static teladeJogo + #1169, #127
  static teladeJogo + #1170, #127
  static teladeJogo + #1171, #771
  static teladeJogo + #1172, #127
  static teladeJogo + #1173, #127
  static teladeJogo + #1174, #127
  static teladeJogo + #1175, #127
  static teladeJogo + #1176, #127
  static teladeJogo + #1177, #127
  static teladeJogo + #1178, #127
  static teladeJogo + #1179, #127
  static teladeJogo + #1180, #127
  static teladeJogo + #1181, #127
  static teladeJogo + #1182, #127
  static teladeJogo + #1183, #127
  static teladeJogo + #1184, #127
  static teladeJogo + #1185, #771
  static teladeJogo + #1186, #127
  static teladeJogo + #1187, #3967
  static teladeJogo + #1188, #127
  static teladeJogo + #1189, #127
  static teladeJogo + #1190, #127
  static teladeJogo + #1191, #127
  static teladeJogo + #1192, #127
  static teladeJogo + #1193, #127
  static teladeJogo + #1194, #127
  static teladeJogo + #1195, #127
  static teladeJogo + #1196, #127
  static teladeJogo + #1197, #127
  static teladeJogo + #1198, #127
  static teladeJogo + #1199, #127

telaFinal : var #1200
  ;Linha 0
  static telaFinal + #0, #127
  static telaFinal + #1, #127
  static telaFinal + #2, #127
  static telaFinal + #3, #127
  static telaFinal + #4, #127
  static telaFinal + #5, #127
  static telaFinal + #6, #127
  static telaFinal + #7, #127
  static telaFinal + #8, #127
  static telaFinal + #9, #127
  static telaFinal + #10, #127
  static telaFinal + #11, #127
  static telaFinal + #12, #127
  static telaFinal + #13, #127
  static telaFinal + #14, #127
  static telaFinal + #15, #127
  static telaFinal + #16, #127
  static telaFinal + #17, #127
  static telaFinal + #18, #127
  static telaFinal + #19, #127
  static telaFinal + #20, #127
  static telaFinal + #21, #127
  static telaFinal + #22, #127
  static telaFinal + #23, #127
  static telaFinal + #24, #127
  static telaFinal + #25, #127
  static telaFinal + #26, #127
  static telaFinal + #27, #127
  static telaFinal + #28, #127
  static telaFinal + #29, #127
  static telaFinal + #30, #127
  static telaFinal + #31, #127
  static telaFinal + #32, #127
  static telaFinal + #33, #127
  static telaFinal + #34, #127
  static telaFinal + #35, #127
  static telaFinal + #36, #127
  static telaFinal + #37, #127
  static telaFinal + #38, #127
  static telaFinal + #39, #127

  ;Linha 1
  static telaFinal + #40, #127
  static telaFinal + #41, #127
  static telaFinal + #42, #127
  static telaFinal + #43, #127
  static telaFinal + #44, #127
  static telaFinal + #45, #127
  static telaFinal + #46, #127
  static telaFinal + #47, #127
  static telaFinal + #48, #127
  static telaFinal + #49, #127
  static telaFinal + #50, #127
  static telaFinal + #51, #127
  static telaFinal + #52, #127
  static telaFinal + #53, #127
  static telaFinal + #54, #127
  static telaFinal + #55, #127
  static telaFinal + #56, #127
  static telaFinal + #57, #127
  static telaFinal + #58, #127
  static telaFinal + #59, #127
  static telaFinal + #60, #127
  static telaFinal + #61, #127
  static telaFinal + #62, #127
  static telaFinal + #63, #127
  static telaFinal + #64, #127
  static telaFinal + #65, #127
  static telaFinal + #66, #127
  static telaFinal + #67, #127
  static telaFinal + #68, #127
  static telaFinal + #69, #127
  static telaFinal + #70, #127
  static telaFinal + #71, #127
  static telaFinal + #72, #127
  static telaFinal + #73, #127
  static telaFinal + #74, #127
  static telaFinal + #75, #127
  static telaFinal + #76, #127
  static telaFinal + #77, #127
  static telaFinal + #78, #127
  static telaFinal + #79, #127

  ;Linha 2
  static telaFinal + #80, #127
  static telaFinal + #81, #127
  static telaFinal + #82, #127
  static telaFinal + #83, #127
  static telaFinal + #84, #127
  static telaFinal + #85, #127
  static telaFinal + #86, #127
  static telaFinal + #87, #127
  static telaFinal + #88, #127
  static telaFinal + #89, #127
  static telaFinal + #90, #127
  static telaFinal + #91, #127
  static telaFinal + #92, #127
  static telaFinal + #93, #127
  static telaFinal + #94, #127
  static telaFinal + #95, #127
  static telaFinal + #96, #127
  static telaFinal + #97, #127
  static telaFinal + #98, #127
  static telaFinal + #99, #127
  static telaFinal + #100, #127
  static telaFinal + #101, #127
  static telaFinal + #102, #127
  static telaFinal + #103, #127
  static telaFinal + #104, #127
  static telaFinal + #105, #127
  static telaFinal + #106, #127
  static telaFinal + #107, #127
  static telaFinal + #108, #127
  static telaFinal + #109, #127
  static telaFinal + #110, #127
  static telaFinal + #111, #127
  static telaFinal + #112, #127
  static telaFinal + #113, #127
  static telaFinal + #114, #127
  static telaFinal + #115, #127
  static telaFinal + #116, #127
  static telaFinal + #117, #127
  static telaFinal + #118, #127
  static telaFinal + #119, #127

  ;Linha 3
  static telaFinal + #120, #127
  static telaFinal + #121, #127
  static telaFinal + #122, #127
  static telaFinal + #123, #127
  static telaFinal + #124, #127
  static telaFinal + #125, #127
  static telaFinal + #126, #127
  static telaFinal + #127, #127
  static telaFinal + #128, #127
  static telaFinal + #129, #127
  static telaFinal + #130, #127
  static telaFinal + #131, #127
  static telaFinal + #132, #127
  static telaFinal + #133, #127
  static telaFinal + #134, #127
  static telaFinal + #135, #127
  static telaFinal + #136, #127
  static telaFinal + #137, #127
  static telaFinal + #138, #127
  static telaFinal + #139, #127
  static telaFinal + #140, #127
  static telaFinal + #141, #127
  static telaFinal + #142, #127
  static telaFinal + #143, #127
  static telaFinal + #144, #127
  static telaFinal + #145, #127
  static telaFinal + #146, #127
  static telaFinal + #147, #127
  static telaFinal + #148, #127
  static telaFinal + #149, #127
  static telaFinal + #150, #127
  static telaFinal + #151, #127
  static telaFinal + #152, #127
  static telaFinal + #153, #127
  static telaFinal + #154, #127
  static telaFinal + #155, #127
  static telaFinal + #156, #127
  static telaFinal + #157, #127
  static telaFinal + #158, #127
  static telaFinal + #159, #127

  ;Linha 4
  static telaFinal + #160, #127
  static telaFinal + #161, #127
  static telaFinal + #162, #127
  static telaFinal + #163, #127
  static telaFinal + #164, #127
  static telaFinal + #165, #127
  static telaFinal + #166, #127
  static telaFinal + #167, #127
  static telaFinal + #168, #127
  static telaFinal + #169, #127
  static telaFinal + #170, #127
  static telaFinal + #171, #127
  static telaFinal + #172, #127
  static telaFinal + #173, #127
  static telaFinal + #174, #127
  static telaFinal + #175, #127
  static telaFinal + #176, #127
  static telaFinal + #177, #127
  static telaFinal + #178, #127
  static telaFinal + #179, #127
  static telaFinal + #180, #127
  static telaFinal + #181, #127
  static telaFinal + #182, #127
  static telaFinal + #183, #127
  static telaFinal + #184, #127
  static telaFinal + #185, #127
  static telaFinal + #186, #127
  static telaFinal + #187, #127
  static telaFinal + #188, #127
  static telaFinal + #189, #127
  static telaFinal + #190, #127
  static telaFinal + #191, #127
  static telaFinal + #192, #127
  static telaFinal + #193, #127
  static telaFinal + #194, #127
  static telaFinal + #195, #127
  static telaFinal + #196, #127
  static telaFinal + #197, #127
  static telaFinal + #198, #127
  static telaFinal + #199, #127

  ;Linha 5
  static telaFinal + #200, #127
  static telaFinal + #201, #127
  static telaFinal + #202, #127
  static telaFinal + #203, #127
  static telaFinal + #204, #127
  static telaFinal + #205, #127
  static telaFinal + #206, #127
  static telaFinal + #207, #127
  static telaFinal + #208, #127
  static telaFinal + #209, #127
  static telaFinal + #210, #127
  static telaFinal + #211, #127
  static telaFinal + #212, #127
  static telaFinal + #213, #127
  static telaFinal + #214, #127
  static telaFinal + #215, #127
  static telaFinal + #216, #127
  static telaFinal + #217, #127
  static telaFinal + #218, #127
  static telaFinal + #219, #127
  static telaFinal + #220, #127
  static telaFinal + #221, #127
  static telaFinal + #222, #127
  static telaFinal + #223, #127
  static telaFinal + #224, #127
  static telaFinal + #225, #127
  static telaFinal + #226, #127
  static telaFinal + #227, #127
  static telaFinal + #228, #127
  static telaFinal + #229, #127
  static telaFinal + #230, #127
  static telaFinal + #231, #127
  static telaFinal + #232, #127
  static telaFinal + #233, #127
  static telaFinal + #234, #127
  static telaFinal + #235, #127
  static telaFinal + #236, #127
  static telaFinal + #237, #127
  static telaFinal + #238, #127
  static telaFinal + #239, #127

  ;Linha 6
  static telaFinal + #240, #127
  static telaFinal + #241, #127
  static telaFinal + #242, #127
  static telaFinal + #243, #127
  static telaFinal + #244, #127
  static telaFinal + #245, #127
  static telaFinal + #246, #127
  static telaFinal + #247, #127
  static telaFinal + #248, #127
  static telaFinal + #249, #127
  static telaFinal + #250, #127
  static telaFinal + #251, #127
  static telaFinal + #252, #127
  static telaFinal + #253, #127
  static telaFinal + #254, #127
  static telaFinal + #255, #127
  static telaFinal + #256, #127
  static telaFinal + #257, #127
  static telaFinal + #258, #127
  static telaFinal + #259, #127
  static telaFinal + #260, #127
  static telaFinal + #261, #127
  static telaFinal + #262, #127
  static telaFinal + #263, #127
  static telaFinal + #264, #127
  static telaFinal + #265, #127
  static telaFinal + #266, #127
  static telaFinal + #267, #127
  static telaFinal + #268, #127
  static telaFinal + #269, #127
  static telaFinal + #270, #127
  static telaFinal + #271, #127
  static telaFinal + #272, #127
  static telaFinal + #273, #127
  static telaFinal + #274, #127
  static telaFinal + #275, #127
  static telaFinal + #276, #127
  static telaFinal + #277, #127
  static telaFinal + #278, #127
  static telaFinal + #279, #127

  ;Linha 7
  static telaFinal + #280, #127
  static telaFinal + #281, #127
  static telaFinal + #282, #127
  static telaFinal + #283, #127
  static telaFinal + #284, #127
  static telaFinal + #285, #127
  static telaFinal + #286, #127
  static telaFinal + #287, #127
  static telaFinal + #288, #127
  static telaFinal + #289, #127
  static telaFinal + #290, #3967
  static telaFinal + #291, #3967
  static telaFinal + #292, #3967
  static telaFinal + #293, #3967
  static telaFinal + #294, #3967
  static telaFinal + #295, #3967
  static telaFinal + #296, #3967
  static telaFinal + #297, #3967
  static telaFinal + #298, #3967
  static telaFinal + #299, #3967
  static telaFinal + #300, #127
  static telaFinal + #301, #127
  static telaFinal + #302, #3967
  static telaFinal + #303, #127
  static telaFinal + #304, #127
  static telaFinal + #305, #127
  static telaFinal + #306, #127
  static telaFinal + #307, #127
  static telaFinal + #308, #127
  static telaFinal + #309, #127
  static telaFinal + #310, #3967
  static telaFinal + #311, #127
  static telaFinal + #312, #127
  static telaFinal + #313, #127
  static telaFinal + #314, #127
  static telaFinal + #315, #127
  static telaFinal + #316, #127
  static telaFinal + #317, #127
  static telaFinal + #318, #127
  static telaFinal + #319, #127

  ;Linha 8
  static telaFinal + #320, #2877
  static telaFinal + #321, #2877
  static telaFinal + #322, #2877
  static telaFinal + #323, #2877
  static telaFinal + #324, #2877
  static telaFinal + #325, #2877
  static telaFinal + #326, #2877
  static telaFinal + #327, #2877
  static telaFinal + #328, #2877
  static telaFinal + #329, #2877
  static telaFinal + #330, #2877
  static telaFinal + #331, #2877
  static telaFinal + #332, #2877
  static telaFinal + #333, #2877
  static telaFinal + #334, #327
  static telaFinal + #335, #321
  static telaFinal + #336, #333
  static telaFinal + #337, #325
  static telaFinal + #338, #2877
  static telaFinal + #339, #335
  static telaFinal + #340, #342
  static telaFinal + #341, #325
  static telaFinal + #342, #338
  static telaFinal + #343, #289
  static telaFinal + #344, #289
  static telaFinal + #345, #289
  static telaFinal + #346, #2877
  static telaFinal + #347, #2877
  static telaFinal + #348, #2877
  static telaFinal + #349, #2877
  static telaFinal + #350, #2877
  static telaFinal + #351, #2877
  static telaFinal + #352, #2877
  static telaFinal + #353, #2877
  static telaFinal + #354, #2877
  static telaFinal + #355, #2877
  static telaFinal + #356, #2877
  static telaFinal + #357, #2877
  static telaFinal + #358, #2877
  static telaFinal + #359, #2877

  ;Linha 9
  static telaFinal + #360, #127
  static telaFinal + #361, #127
  static telaFinal + #362, #127
  static telaFinal + #363, #127
  static telaFinal + #364, #127
  static telaFinal + #365, #127
  static telaFinal + #366, #127
  static telaFinal + #367, #127
  static telaFinal + #368, #127
  static telaFinal + #369, #127
  static telaFinal + #370, #127
  static telaFinal + #371, #127
  static telaFinal + #372, #127
  static telaFinal + #373, #127
  static telaFinal + #374, #127
  static telaFinal + #375, #127
  static telaFinal + #376, #127
  static telaFinal + #377, #127
  static telaFinal + #378, #127
  static telaFinal + #379, #127
  static telaFinal + #380, #127
  static telaFinal + #381, #127
  static telaFinal + #382, #127
  static telaFinal + #383, #127
  static telaFinal + #384, #127
  static telaFinal + #385, #127
  static telaFinal + #386, #127
  static telaFinal + #387, #127
  static telaFinal + #388, #127
  static telaFinal + #389, #127
  static telaFinal + #390, #127
  static telaFinal + #391, #127
  static telaFinal + #392, #3967
  static telaFinal + #393, #3967
  static telaFinal + #394, #3967
  static telaFinal + #395, #3967
  static telaFinal + #396, #3967
  static telaFinal + #397, #3967
  static telaFinal + #398, #127
  static telaFinal + #399, #127

  ;Linha 10
  static telaFinal + #400, #127
  static telaFinal + #401, #127
  static telaFinal + #402, #127
  static telaFinal + #403, #127
  static telaFinal + #404, #127
  static telaFinal + #405, #127
  static telaFinal + #406, #127
  static telaFinal + #407, #127
  static telaFinal + #408, #127
  static telaFinal + #409, #127
  static telaFinal + #410, #127
  static telaFinal + #411, #127
  static telaFinal + #412, #127
  static telaFinal + #413, #127
  static telaFinal + #414, #127
  static telaFinal + #415, #127
  static telaFinal + #416, #127
  static telaFinal + #417, #127
  static telaFinal + #418, #127
  static telaFinal + #419, #127
  static telaFinal + #420, #127
  static telaFinal + #421, #127
  static telaFinal + #422, #127
  static telaFinal + #423, #127
  static telaFinal + #424, #127
  static telaFinal + #425, #127
  static telaFinal + #426, #127
  static telaFinal + #427, #127
  static telaFinal + #428, #127
  static telaFinal + #429, #127
  static telaFinal + #430, #127
  static telaFinal + #431, #127
  static telaFinal + #432, #127
  static telaFinal + #433, #127
  static telaFinal + #434, #127
  static telaFinal + #435, #127
  static telaFinal + #436, #127
  static telaFinal + #437, #3967
  static telaFinal + #438, #127
  static telaFinal + #439, #127

  ;Linha 11
  static telaFinal + #440, #127
  static telaFinal + #441, #127
  static telaFinal + #442, #127
  static telaFinal + #443, #127
  static telaFinal + #444, #127
  static telaFinal + #445, #127
  static telaFinal + #446, #127
  static telaFinal + #447, #127
  static telaFinal + #448, #127
  static telaFinal + #449, #127
  static telaFinal + #450, #127
  static telaFinal + #451, #127
  static telaFinal + #452, #127
  static telaFinal + #453, #127
  static telaFinal + #454, #127
  static telaFinal + #455, #127
  static telaFinal + #456, #127
  static telaFinal + #457, #127
  static telaFinal + #458, #127
  static telaFinal + #459, #127
  static telaFinal + #460, #127
  static telaFinal + #461, #127
  static telaFinal + #462, #127
  static telaFinal + #463, #127
  static telaFinal + #464, #127
  static telaFinal + #465, #127
  static telaFinal + #466, #127
  static telaFinal + #467, #127
  static telaFinal + #468, #127
  static telaFinal + #469, #127
  static telaFinal + #470, #127
  static telaFinal + #471, #127
  static telaFinal + #472, #127
  static telaFinal + #473, #127
  static telaFinal + #474, #127
  static telaFinal + #475, #127
  static telaFinal + #476, #127
  static telaFinal + #477, #127
  static telaFinal + #478, #127
  static telaFinal + #479, #127

  ;Linha 12
  static telaFinal + #480, #127
  static telaFinal + #481, #127
  static telaFinal + #482, #127
  static telaFinal + #483, #127
  static telaFinal + #484, #127
  static telaFinal + #485, #127
  static telaFinal + #486, #127
  static telaFinal + #487, #127
  static telaFinal + #488, #127
  static telaFinal + #489, #127
  static telaFinal + #490, #127
  static telaFinal + #491, #127
  static telaFinal + #492, #127
  static telaFinal + #493, #127
  static telaFinal + #494, #127
  static telaFinal + #495, #127
  static telaFinal + #496, #127
  static telaFinal + #497, #127
  static telaFinal + #498, #127
  static telaFinal + #499, #127
  static telaFinal + #500, #127
  static telaFinal + #501, #127
  static telaFinal + #502, #127
  static telaFinal + #503, #127
  static telaFinal + #504, #127
  static telaFinal + #505, #127
  static telaFinal + #506, #127
  static telaFinal + #507, #127
  static telaFinal + #508, #127
  static telaFinal + #509, #127
  static telaFinal + #510, #127
  static telaFinal + #511, #127
  static telaFinal + #512, #127
  static telaFinal + #513, #127
  static telaFinal + #514, #127
  static telaFinal + #515, #127
  static telaFinal + #516, #127
  static telaFinal + #517, #127
  static telaFinal + #518, #127
  static telaFinal + #519, #127

  ;Linha 13
  static telaFinal + #520, #127
  static telaFinal + #521, #127
  static telaFinal + #522, #127
  static telaFinal + #523, #127
  static telaFinal + #524, #127
  static telaFinal + #525, #127
  static telaFinal + #526, #127
  static telaFinal + #527, #127
  static telaFinal + #528, #127
  static telaFinal + #529, #2881
  static telaFinal + #530, #2896
  static telaFinal + #531, #2885
  static telaFinal + #532, #2898
  static telaFinal + #533, #2900
  static telaFinal + #534, #2885
  static telaFinal + #535, #127
  static telaFinal + #536, #2899
  static telaFinal + #537, #3967
  static telaFinal + #538, #2896
  static telaFinal + #539, #2881
  static telaFinal + #540, #2898
  static telaFinal + #541, #2881
  static telaFinal + #542, #127
  static telaFinal + #543, #127
  static telaFinal + #544, #127
  static telaFinal + #545, #127
  static telaFinal + #546, #127
  static telaFinal + #547, #127
  static telaFinal + #548, #127
  static telaFinal + #549, #127
  static telaFinal + #550, #127
  static telaFinal + #551, #127
  static telaFinal + #552, #127
  static telaFinal + #553, #127
  static telaFinal + #554, #127
  static telaFinal + #555, #127
  static telaFinal + #556, #127
  static telaFinal + #557, #127
  static telaFinal + #558, #127
  static telaFinal + #559, #127

  ;Linha 14
  static telaFinal + #560, #127
  static telaFinal + #561, #127
  static telaFinal + #562, #127
  static telaFinal + #563, #127
  static telaFinal + #564, #127
  static telaFinal + #565, #127
  static telaFinal + #566, #127
  static telaFinal + #567, #127
  static telaFinal + #568, #127
  static telaFinal + #569, #127
  static telaFinal + #570, #127
  static telaFinal + #571, #127
  static telaFinal + #572, #127
  static telaFinal + #573, #127
  static telaFinal + #574, #127
  static telaFinal + #575, #127
  static telaFinal + #576, #127
  static telaFinal + #577, #127
  static telaFinal + #578, #127
  static telaFinal + #579, #3967
  static telaFinal + #580, #127
  static telaFinal + #581, #127
  static telaFinal + #582, #127
  static telaFinal + #583, #127
  static telaFinal + #584, #127
  static telaFinal + #585, #127
  static telaFinal + #586, #127
  static telaFinal + #587, #127
  static telaFinal + #588, #127
  static telaFinal + #589, #127
  static telaFinal + #590, #127
  static telaFinal + #591, #127
  static telaFinal + #592, #127
  static telaFinal + #593, #127
  static telaFinal + #594, #127
  static telaFinal + #595, #127
  static telaFinal + #596, #127
  static telaFinal + #597, #127
  static telaFinal + #598, #127
  static telaFinal + #599, #127

  ;Linha 15
  static telaFinal + #600, #127
  static telaFinal + #601, #127
  static telaFinal + #602, #127
  static telaFinal + #603, #127
  static telaFinal + #604, #127
  static telaFinal + #605, #127
  static telaFinal + #606, #127
  static telaFinal + #607, #127
  static telaFinal + #608, #127
  static telaFinal + #609, #127
  static telaFinal + #610, #127
  static telaFinal + #611, #127
  static telaFinal + #612, #127
  static telaFinal + #613, #127
  static telaFinal + #614, #127
  static telaFinal + #615, #127
  static telaFinal + #616, #127
  static telaFinal + #617, #127
  static telaFinal + #618, #127
  static telaFinal + #619, #2898
  static telaFinal + #620, #2885
  static telaFinal + #621, #2889
  static telaFinal + #622, #2894
  static telaFinal + #623, #2889
  static telaFinal + #624, #2883
  static telaFinal + #625, #2889
  static telaFinal + #626, #2881
  static telaFinal + #627, #2898
  static telaFinal + #628, #127
  static telaFinal + #629, #127
  static telaFinal + #630, #127
  static telaFinal + #631, #127
  static telaFinal + #632, #127
  static telaFinal + #633, #127
  static telaFinal + #634, #127
  static telaFinal + #635, #127
  static telaFinal + #636, #127
  static telaFinal + #637, #127
  static telaFinal + #638, #127
  static telaFinal + #639, #127

  ;Linha 16
  static telaFinal + #640, #127
  static telaFinal + #641, #127
  static telaFinal + #642, #127
  static telaFinal + #643, #127
  static telaFinal + #644, #127
  static telaFinal + #645, #127
  static telaFinal + #646, #127
  static telaFinal + #647, #127
  static telaFinal + #648, #127
  static telaFinal + #649, #127
  static telaFinal + #650, #127
  static telaFinal + #651, #127
  static telaFinal + #652, #127
  static telaFinal + #653, #127
  static telaFinal + #654, #127
  static telaFinal + #655, #127
  static telaFinal + #656, #127
  static telaFinal + #657, #127
  static telaFinal + #658, #127
  static telaFinal + #659, #127
  static telaFinal + #660, #127
  static telaFinal + #661, #127
  static telaFinal + #662, #127
  static telaFinal + #663, #127
  static telaFinal + #664, #127
  static telaFinal + #665, #127
  static telaFinal + #666, #127
  static telaFinal + #667, #127
  static telaFinal + #668, #127
  static telaFinal + #669, #127
  static telaFinal + #670, #127
  static telaFinal + #671, #127
  static telaFinal + #672, #127
  static telaFinal + #673, #127
  static telaFinal + #674, #127
  static telaFinal + #675, #127
  static telaFinal + #676, #127
  static telaFinal + #677, #127
  static telaFinal + #678, #127
  static telaFinal + #679, #127

  ;Linha 17
  static telaFinal + #680, #127
  static telaFinal + #681, #127
  static telaFinal + #682, #127
  static telaFinal + #683, #127
  static telaFinal + #684, #127
  static telaFinal + #685, #127
  static telaFinal + #686, #127
  static telaFinal + #687, #127
  static telaFinal + #688, #127
  static telaFinal + #689, #127
  static telaFinal + #690, #127
  static telaFinal + #691, #127
  static telaFinal + #692, #127
  static telaFinal + #693, #127
  static telaFinal + #694, #127
  static telaFinal + #695, #127
  static telaFinal + #696, #127
  static telaFinal + #697, #127
  static telaFinal + #698, #127
  static telaFinal + #699, #127
  static telaFinal + #700, #127
  static telaFinal + #701, #127
  static telaFinal + #702, #127
  static telaFinal + #703, #127
  static telaFinal + #704, #127
  static telaFinal + #705, #127
  static telaFinal + #706, #127
  static telaFinal + #707, #127
  static telaFinal + #708, #127
  static telaFinal + #709, #127
  static telaFinal + #710, #127
  static telaFinal + #711, #127
  static telaFinal + #712, #127
  static telaFinal + #713, #127
  static telaFinal + #714, #127
  static telaFinal + #715, #127
  static telaFinal + #716, #127
  static telaFinal + #717, #127
  static telaFinal + #718, #127
  static telaFinal + #719, #127

  ;Linha 18
  static telaFinal + #720, #127
  static telaFinal + #721, #127
  static telaFinal + #722, #127
  static telaFinal + #723, #127
  static telaFinal + #724, #127
  static telaFinal + #725, #127
  static telaFinal + #726, #127
  static telaFinal + #727, #127
  static telaFinal + #728, #127
  static telaFinal + #729, #127
  static telaFinal + #730, #127
  static telaFinal + #731, #127
  static telaFinal + #732, #127
  static telaFinal + #733, #127
  static telaFinal + #734, #127
  static telaFinal + #735, #127
  static telaFinal + #736, #127
  static telaFinal + #737, #127
  static telaFinal + #738, #127
  static telaFinal + #739, #127
  static telaFinal + #740, #127
  static telaFinal + #741, #127
  static telaFinal + #742, #127
  static telaFinal + #743, #127
  static telaFinal + #744, #127
  static telaFinal + #745, #127
  static telaFinal + #746, #127
  static telaFinal + #747, #127
  static telaFinal + #748, #127
  static telaFinal + #749, #127
  static telaFinal + #750, #127
  static telaFinal + #751, #127
  static telaFinal + #752, #127
  static telaFinal + #753, #127
  static telaFinal + #754, #127
  static telaFinal + #755, #127
  static telaFinal + #756, #127
  static telaFinal + #757, #127
  static telaFinal + #758, #127
  static telaFinal + #759, #127

  ;Linha 19
  static telaFinal + #760, #127
  static telaFinal + #761, #127
  static telaFinal + #762, #127
  static telaFinal + #763, #127
  static telaFinal + #764, #127
  static telaFinal + #765, #127
  static telaFinal + #766, #127
  static telaFinal + #767, #127
  static telaFinal + #768, #127
  static telaFinal + #769, #127
  static telaFinal + #770, #127
  static telaFinal + #771, #127
  static telaFinal + #772, #127
  static telaFinal + #773, #127
  static telaFinal + #774, #127
  static telaFinal + #775, #127
  static telaFinal + #776, #127
  static telaFinal + #777, #127
  static telaFinal + #778, #127
  static telaFinal + #779, #127
  static telaFinal + #780, #127
  static telaFinal + #781, #127
  static telaFinal + #782, #127
  static telaFinal + #783, #127
  static telaFinal + #784, #127
  static telaFinal + #785, #127
  static telaFinal + #786, #127
  static telaFinal + #787, #127
  static telaFinal + #788, #127
  static telaFinal + #789, #127
  static telaFinal + #790, #127
  static telaFinal + #791, #127
  static telaFinal + #792, #127
  static telaFinal + #793, #127
  static telaFinal + #794, #127
  static telaFinal + #795, #127
  static telaFinal + #796, #127
  static telaFinal + #797, #127
  static telaFinal + #798, #127
  static telaFinal + #799, #127

  ;Linha 20
  static telaFinal + #800, #127
  static telaFinal + #801, #127
  static telaFinal + #802, #127
  static telaFinal + #803, #127
  static telaFinal + #804, #127
  static telaFinal + #805, #127
  static telaFinal + #806, #127
  static telaFinal + #807, #127
  static telaFinal + #808, #127
  static telaFinal + #809, #127
  static telaFinal + #810, #127
  static telaFinal + #811, #127
  static telaFinal + #812, #127
  static telaFinal + #813, #127
  static telaFinal + #814, #127
  static telaFinal + #815, #127
  static telaFinal + #816, #127
  static telaFinal + #817, #127
  static telaFinal + #818, #127
  static telaFinal + #819, #127
  static telaFinal + #820, #127
  static telaFinal + #821, #127
  static telaFinal + #822, #127
  static telaFinal + #823, #127
  static telaFinal + #824, #127
  static telaFinal + #825, #127
  static telaFinal + #826, #127
  static telaFinal + #827, #127
  static telaFinal + #828, #127
  static telaFinal + #829, #127
  static telaFinal + #830, #127
  static telaFinal + #831, #127
  static telaFinal + #832, #127
  static telaFinal + #833, #127
  static telaFinal + #834, #127
  static telaFinal + #835, #127
  static telaFinal + #836, #127
  static telaFinal + #837, #127
  static telaFinal + #838, #127
  static telaFinal + #839, #127

  ;Linha 21
  static telaFinal + #840, #127
  static telaFinal + #841, #127
  static telaFinal + #842, #127
  static telaFinal + #843, #127
  static telaFinal + #844, #127
  static telaFinal + #845, #127
  static telaFinal + #846, #127
  static telaFinal + #847, #127
  static telaFinal + #848, #127
  static telaFinal + #849, #127
  static telaFinal + #850, #127
  static telaFinal + #851, #127
  static telaFinal + #852, #127
  static telaFinal + #853, #127
  static telaFinal + #854, #127
  static telaFinal + #855, #127
  static telaFinal + #856, #127
  static telaFinal + #857, #127
  static telaFinal + #858, #127
  static telaFinal + #859, #127
  static telaFinal + #860, #127
  static telaFinal + #861, #127
  static telaFinal + #862, #127
  static telaFinal + #863, #127
  static telaFinal + #864, #127
  static telaFinal + #865, #127
  static telaFinal + #866, #127
  static telaFinal + #867, #127
  static telaFinal + #868, #127
  static telaFinal + #869, #127
  static telaFinal + #870, #127
  static telaFinal + #871, #127
  static telaFinal + #872, #127
  static telaFinal + #873, #127
  static telaFinal + #874, #127
  static telaFinal + #875, #127
  static telaFinal + #876, #127
  static telaFinal + #877, #127
  static telaFinal + #878, #127
  static telaFinal + #879, #127

  ;Linha 22
  static telaFinal + #880, #127
  static telaFinal + #881, #127
  static telaFinal + #882, #127
  static telaFinal + #883, #127
  static telaFinal + #884, #127
  static telaFinal + #885, #127
  static telaFinal + #886, #127
  static telaFinal + #887, #127
  static telaFinal + #888, #127
  static telaFinal + #889, #127
  static telaFinal + #890, #127
  static telaFinal + #891, #127
  static telaFinal + #892, #127
  static telaFinal + #893, #127
  static telaFinal + #894, #127
  static telaFinal + #895, #127
  static telaFinal + #896, #127
  static telaFinal + #897, #127
  static telaFinal + #898, #127
  static telaFinal + #899, #127
  static telaFinal + #900, #127
  static telaFinal + #901, #127
  static telaFinal + #902, #127
  static telaFinal + #903, #127
  static telaFinal + #904, #127
  static telaFinal + #905, #127
  static telaFinal + #906, #127
  static telaFinal + #907, #127
  static telaFinal + #908, #127
  static telaFinal + #909, #127
  static telaFinal + #910, #127
  static telaFinal + #911, #127
  static telaFinal + #912, #127
  static telaFinal + #913, #127
  static telaFinal + #914, #127
  static telaFinal + #915, #127
  static telaFinal + #916, #127
  static telaFinal + #917, #127
  static telaFinal + #918, #127
  static telaFinal + #919, #127

  ;Linha 23
  static telaFinal + #920, #127
  static telaFinal + #921, #127
  static telaFinal + #922, #127
  static telaFinal + #923, #127
  static telaFinal + #924, #127
  static telaFinal + #925, #127
  static telaFinal + #926, #127
  static telaFinal + #927, #127
  static telaFinal + #928, #127
  static telaFinal + #929, #127
  static telaFinal + #930, #127
  static telaFinal + #931, #127
  static telaFinal + #932, #127
  static telaFinal + #933, #127
  static telaFinal + #934, #127
  static telaFinal + #935, #127
  static telaFinal + #936, #127
  static telaFinal + #937, #127
  static telaFinal + #938, #127
  static telaFinal + #939, #127
  static telaFinal + #940, #127
  static telaFinal + #941, #127
  static telaFinal + #942, #127
  static telaFinal + #943, #127
  static telaFinal + #944, #127
  static telaFinal + #945, #127
  static telaFinal + #946, #127
  static telaFinal + #947, #127
  static telaFinal + #948, #127
  static telaFinal + #949, #127
  static telaFinal + #950, #127
  static telaFinal + #951, #127
  static telaFinal + #952, #127
  static telaFinal + #953, #127
  static telaFinal + #954, #127
  static telaFinal + #955, #127
  static telaFinal + #956, #127
  static telaFinal + #957, #127
  static telaFinal + #958, #127
  static telaFinal + #959, #127

  ;Linha 24
  static telaFinal + #960, #127
  static telaFinal + #961, #127
  static telaFinal + #962, #127
  static telaFinal + #963, #127
  static telaFinal + #964, #127
  static telaFinal + #965, #127
  static telaFinal + #966, #127
  static telaFinal + #967, #127
  static telaFinal + #968, #127
  static telaFinal + #969, #127
  static telaFinal + #970, #127
  static telaFinal + #971, #127
  static telaFinal + #972, #127
  static telaFinal + #973, #127
  static telaFinal + #974, #127
  static telaFinal + #975, #127
  static telaFinal + #976, #127
  static telaFinal + #977, #127
  static telaFinal + #978, #127
  static telaFinal + #979, #127
  static telaFinal + #980, #127
  static telaFinal + #981, #127
  static telaFinal + #982, #127
  static telaFinal + #983, #127
  static telaFinal + #984, #127
  static telaFinal + #985, #127
  static telaFinal + #986, #127
  static telaFinal + #987, #127
  static telaFinal + #988, #127
  static telaFinal + #989, #127
  static telaFinal + #990, #127
  static telaFinal + #991, #127
  static telaFinal + #992, #127
  static telaFinal + #993, #127
  static telaFinal + #994, #127
  static telaFinal + #995, #127
  static telaFinal + #996, #127
  static telaFinal + #997, #127
  static telaFinal + #998, #127
  static telaFinal + #999, #127

  ;Linha 25
  static telaFinal + #1000, #127
  static telaFinal + #1001, #127
  static telaFinal + #1002, #127
  static telaFinal + #1003, #127
  static telaFinal + #1004, #127
  static telaFinal + #1005, #127
  static telaFinal + #1006, #127
  static telaFinal + #1007, #127
  static telaFinal + #1008, #127
  static telaFinal + #1009, #127
  static telaFinal + #1010, #127
  static telaFinal + #1011, #127
  static telaFinal + #1012, #127
  static telaFinal + #1013, #127
  static telaFinal + #1014, #127
  static telaFinal + #1015, #127
  static telaFinal + #1016, #127
  static telaFinal + #1017, #127
  static telaFinal + #1018, #127
  static telaFinal + #1019, #127
  static telaFinal + #1020, #127
  static telaFinal + #1021, #127
  static telaFinal + #1022, #127
  static telaFinal + #1023, #127
  static telaFinal + #1024, #127
  static telaFinal + #1025, #127
  static telaFinal + #1026, #127
  static telaFinal + #1027, #127
  static telaFinal + #1028, #127
  static telaFinal + #1029, #127
  static telaFinal + #1030, #127
  static telaFinal + #1031, #127
  static telaFinal + #1032, #127
  static telaFinal + #1033, #127
  static telaFinal + #1034, #127
  static telaFinal + #1035, #127
  static telaFinal + #1036, #127
  static telaFinal + #1037, #127
  static telaFinal + #1038, #127
  static telaFinal + #1039, #127

  ;Linha 26
  static telaFinal + #1040, #127
  static telaFinal + #1041, #127
  static telaFinal + #1042, #127
  static telaFinal + #1043, #127
  static telaFinal + #1044, #127
  static telaFinal + #1045, #127
  static telaFinal + #1046, #127
  static telaFinal + #1047, #127
  static telaFinal + #1048, #127
  static telaFinal + #1049, #127
  static telaFinal + #1050, #127
  static telaFinal + #1051, #127
  static telaFinal + #1052, #127
  static telaFinal + #1053, #127
  static telaFinal + #1054, #127
  static telaFinal + #1055, #127
  static telaFinal + #1056, #127
  static telaFinal + #1057, #127
  static telaFinal + #1058, #127
  static telaFinal + #1059, #127
  static telaFinal + #1060, #127
  static telaFinal + #1061, #127
  static telaFinal + #1062, #127
  static telaFinal + #1063, #127
  static telaFinal + #1064, #127
  static telaFinal + #1065, #127
  static telaFinal + #1066, #127
  static telaFinal + #1067, #127
  static telaFinal + #1068, #127
  static telaFinal + #1069, #127
  static telaFinal + #1070, #127
  static telaFinal + #1071, #127
  static telaFinal + #1072, #127
  static telaFinal + #1073, #127
  static telaFinal + #1074, #127
  static telaFinal + #1075, #127
  static telaFinal + #1076, #127
  static telaFinal + #1077, #127
  static telaFinal + #1078, #127
  static telaFinal + #1079, #127

  ;Linha 27
  static telaFinal + #1080, #127
  static telaFinal + #1081, #127
  static telaFinal + #1082, #127
  static telaFinal + #1083, #127
  static telaFinal + #1084, #127
  static telaFinal + #1085, #127
  static telaFinal + #1086, #127
  static telaFinal + #1087, #127
  static telaFinal + #1088, #127
  static telaFinal + #1089, #127
  static telaFinal + #1090, #127
  static telaFinal + #1091, #127
  static telaFinal + #1092, #127
  static telaFinal + #1093, #127
  static telaFinal + #1094, #127
  static telaFinal + #1095, #127
  static telaFinal + #1096, #127
  static telaFinal + #1097, #127
  static telaFinal + #1098, #127
  static telaFinal + #1099, #127
  static telaFinal + #1100, #127
  static telaFinal + #1101, #127
  static telaFinal + #1102, #127
  static telaFinal + #1103, #127
  static telaFinal + #1104, #127
  static telaFinal + #1105, #127
  static telaFinal + #1106, #127
  static telaFinal + #1107, #127
  static telaFinal + #1108, #127
  static telaFinal + #1109, #127
  static telaFinal + #1110, #127
  static telaFinal + #1111, #127
  static telaFinal + #1112, #127
  static telaFinal + #1113, #127
  static telaFinal + #1114, #127
  static telaFinal + #1115, #127
  static telaFinal + #1116, #127
  static telaFinal + #1117, #127
  static telaFinal + #1118, #127
  static telaFinal + #1119, #127

  ;Linha 28
  static telaFinal + #1120, #127
  static telaFinal + #1121, #127
  static telaFinal + #1122, #127
  static telaFinal + #1123, #127
  static telaFinal + #1124, #127
  static telaFinal + #1125, #127
  static telaFinal + #1126, #127
  static telaFinal + #1127, #127
  static telaFinal + #1128, #127
  static telaFinal + #1129, #127
  static telaFinal + #1130, #127
  static telaFinal + #1131, #127
  static telaFinal + #1132, #127
  static telaFinal + #1133, #127
  static telaFinal + #1134, #127
  static telaFinal + #1135, #127
  static telaFinal + #1136, #127
  static telaFinal + #1137, #127
  static telaFinal + #1138, #127
  static telaFinal + #1139, #127
  static telaFinal + #1140, #127
  static telaFinal + #1141, #127
  static telaFinal + #1142, #127
  static telaFinal + #1143, #127
  static telaFinal + #1144, #127
  static telaFinal + #1145, #127
  static telaFinal + #1146, #127
  static telaFinal + #1147, #127
  static telaFinal + #1148, #127
  static telaFinal + #1149, #127
  static telaFinal + #1150, #127
  static telaFinal + #1151, #127
  static telaFinal + #1152, #127
  static telaFinal + #1153, #127
  static telaFinal + #1154, #127
  static telaFinal + #1155, #127
  static telaFinal + #1156, #127
  static telaFinal + #1157, #127
  static telaFinal + #1158, #127
  static telaFinal + #1159, #127

  ;Linha 29
  static telaFinal + #1160, #127
  static telaFinal + #1161, #127
  static telaFinal + #1162, #127
  static telaFinal + #1163, #127
  static telaFinal + #1164, #127
  static telaFinal + #1165, #127
  static telaFinal + #1166, #127
  static telaFinal + #1167, #127
  static telaFinal + #1168, #127
  static telaFinal + #1169, #127
  static telaFinal + #1170, #127
  static telaFinal + #1171, #127
  static telaFinal + #1172, #127
  static telaFinal + #1173, #127
  static telaFinal + #1174, #127
  static telaFinal + #1175, #127
  static telaFinal + #1176, #127
  static telaFinal + #1177, #127
  static telaFinal + #1178, #127
  static telaFinal + #1179, #127
  static telaFinal + #1180, #127
  static telaFinal + #1181, #127
  static telaFinal + #1182, #127
  static telaFinal + #1183, #127
  static telaFinal + #1184, #127
  static telaFinal + #1185, #127
  static telaFinal + #1186, #127
  static telaFinal + #1187, #127
  static telaFinal + #1188, #127
  static telaFinal + #1189, #127
  static telaFinal + #1190, #127
  static telaFinal + #1191, #127
  static telaFinal + #1192, #127
  static telaFinal + #1193, #127
  static telaFinal + #1194, #127
  static telaFinal + #1195, #127
  static telaFinal + #1196, #127
  static telaFinal + #1197, #127
  static telaFinal + #1198, #127
  static telaFinal + #1199, #127
