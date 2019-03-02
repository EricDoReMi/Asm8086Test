;将cmos中的月份显示在屏幕上
assume cs:codesg

codesg segment
 start:mov al,8
       out 70h,al
       in al,71h

       mov ah,al
       mov cl,4
       shr ah,cl
       and al,00001111b

       add al,30h
       add ah,30h

       mov bx,0b800h
       mov es,bx
       mov byte ptr es:[160*12+40*2],ah
       mov byte ptr es:[160*12+40*2+2],ah

       mov ax,4c00h
       int 21h
codesg ends
end start