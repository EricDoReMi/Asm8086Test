;在屏幕上显示时间信息
assume cs:codesg

datas segment
      db 9,8,7,4,2,0
      db 'YY/mm/DD HH:MM:SS','$'
datas ends

stack segment
      db 16 dup(0)
stack ends

codesg segment
 start:mov ax,datas
       mov ds,ax
       mov ax,stack
       mov ss,ax
       mov sp,16
       
       call getStr

       mov ah,2;显示字符信息
       mov bh,0
       mov dh,5
       mov dl,12
       int 10h

       mov dx,6
       mov ah,9
       int 21h
       
       
       mov ax,4c00h
       int 21h

getStr:push bx
       mov si,0
       mov di,6
       mov cx,6
     s:push cx
       mov al,[si]
       out 70h,al
       in al,71h
       mov bl,al
       mov bh,al
       mov cl,4
       shr bl,cl
       and bh,00001111b

       add bh,30h
       add bl,30h

       mov word ptr [di],bx
       inc si
       add di,3
       pop cx
       loop s

       pop bx
       
       
       ret

codesg ends
end start

