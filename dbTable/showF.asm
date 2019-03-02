assume cs:codesg,ds:datas

datas segment
      table db '0123456789ABCDEF'
datas ends

codesg segment

 start:
       mov ax,datas
       mov ds,ax

       mov ax,10
       call showByte

       mov ax,4c00h
       int 21h

 showByte:
          push ax
	  push bx
	  push cx
          push dx
	  push es
          
	  mov dx,0b800h
	  mov es,dx

          mov ah,0
	  mov bx,ax
	  mov cl,4
	  shr bx,cl
          

	  mov dh,table[bx]

	  and al,00001111b
	  mov bh,0
	  mov bl,al
	  
	  mov dl,table[bx]

	  
	  mov es:[160*12+40*2],dh
	  mov es:[160*12+40*2+2],dl

	  pop es
	  pop dx
	  pop cx
	  pop bx
	  pop ax

	  ret

codesg ends
end start