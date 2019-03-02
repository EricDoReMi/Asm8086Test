assume cs:codesg

codesg segment

start:mov ax,cs
      mov ds,ax
      mov si,offset sqr
      mov ax,0
      mov es,ax
      mov di,200h
      mov cx,offset sqrend-offset sqr
      cld
      rep movsb

      mov ax,0
      mov es,ax
      mov word ptr es:[4*7ch],200h
      mov word ptr es:[4*7ch+2],0h
      
      mov ax,4c00h
      int 21h

  sqr:mul ax
      iret
 sqrend:nop

codesg ends

end start