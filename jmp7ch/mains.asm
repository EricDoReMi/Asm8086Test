assume cs:codesg

datas segment
      db 'conversation',0
datas ends

codesg segment
 start:mov ax,datas
       mov ds,ax
       mov si,0
       mov ax,0b800h
       mov es,ax
       mov di,12*60

     s:cmp byte ptr [si],0
       je ok
       mov al,[si]
       mov es:[di],al
       inc si
       add di,2
       mov bx,offset s-offset ok
       int 7ch

    ok:mov ax,4c00h
       int 21h


codesg ends

end start
