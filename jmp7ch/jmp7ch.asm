assume cs:codesg

codesg segment
 start:mov ax,cs
       mov ds,ax
       mov si,offset jpa
       mov ax,0
       mov es,ax
       mov di,200h
       mov cx,offset jpd-offset jpa
       cld
       rep movsb

       mov ax,0
       mov es,ax
       mov word ptr es:[4*7ch],200h
       mov word ptr es:[4*7ch+2],0h

       mov ax,4c00h
       int 21h

   jpa:push bp
       mov bp,sp
       add [bp+2],bx
       pop bp
       iret

       mov ax,4c00h
       int 21h

  jpd:nop
codesg ends
end start