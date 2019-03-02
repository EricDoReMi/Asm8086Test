assume cs:codesg

codesg segment
 start:mov ah,2;设置光标位置
       mov bh,0
       mov dh,5
       mov dl,12
       int 10h
       
       mov ah,9;在光标位置处显示字符串
       mov al,'a'
       mov bl,11001010b
       mov bh,0
       mov cx,3
       int 10h

       mov ax,4c00h
       int 21h
codesg ends
end start