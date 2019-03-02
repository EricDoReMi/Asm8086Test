;(ax)=(ax)*10
assume cs:codesg

codesg segment
 start:mov ax,3
       mov bx,ax
       shl ax,1
       mov cl,3
       shl bx,cl
       add ax,bx

       mov ax,4c00h
       int 21h

codesg ends
end start
