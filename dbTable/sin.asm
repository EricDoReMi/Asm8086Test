;œ‘ æsin(x)£¨x Ù”⁄£®0,30,60,90,120,150,180£©
assume cs:codesg,ds:datas

datas segment
      table dw ag0,ag30,ag60,ag90,ag120,ag150,ag180
      ag0   db '0',0
      ag30  db '0.5',0
      ag60  db '0.866',0
      ag90  db '1',0
      ag120 db '0.866',0
      ag150 db '0.5',0
      ag180 db '0',0
datas ends

codesg segment

 start:
       mov ax,datas
       mov ds,ax

       mov ax,60
       call sin

       mov ax,4c00h
       int 21h

    sin:
        push ax
	push bx
	push es
	push si
	push di

        mov bl,30
	div bl
	mov bl,al
	mov bh,0
	add bx,bx
	mov bx,table[bx]

        mov ax,0b800h
	mov es,ax
	mov di,160*12+40*2

  shows:mov al,[bx]
        cmp al,0
	je sined
	mov es:[di],al
	inc bx
	add di,2
        jmp shows

  sined:pop di
        pop si
	pop es
	pop bx
	pop ax

	ret

codesg ends
end start