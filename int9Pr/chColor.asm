;按下F1键时改变屏幕颜色
assume cs:codesg

stack segment
      db 128 dup(0)
stack ends

codesg segment

 start:mov ax,stack
       mov ss,ax
       mov sp,128
       
;======install===============

       push cs
       pop ds
       
       mov ax,0
       mov es,ax

       mov si,offset myint9
       mov di,204h
       mov cx,offset myint9ed-offset myint9

       cld
       rep movsb

;======changeInt9segment=======
      push es:[4*9]
      pop  es:[200h]
      push es:[4*9+2]
      pop  es:[202h]

      cli

      mov word ptr es:[4*9],204h
      mov word ptr es:[4*9+2],0

      sti


       mov ax,4c00h
       int 21h
       

 myint9:push ax
        push bx
	push cx
	push es

        in al,60h
	pushf
  
        call dword ptr cs:[200h]

        cmp al,3bh
        jne myint9ot
       
        mov ax,0b800h
	mov es,ax
	mov bx,1
	mov cx,2000
      s:inc byte ptr es:[bx]
        add bx,2
	loop s
        
        
myint9ot:pop es
         pop cx
         pop bx
	 pop ax
         iret


 myint9ed:nop
       
       
       



       
codesg ends
end start 