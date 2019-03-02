assume cs:codesg

codesg segment
 start:mov ax,0
       mov es,ax
       mov ax,200h
       mov di,ax
       mov ax,cs
       mov ds,ax
       mov si,offset lp
       mov cx,offset lpend-offset lp
       cld
       rep movsb

       mov ax,4c00h
       int 21h

    lp:push bp
       mov bp,sp
       dec cx
       jcxz lpret
       add [bp+2],bx
 lpret:pop bp
       iret
 lpend:nop

codesg ends
end start