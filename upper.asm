;������data���е��ַ���ת��Ϊ��д

assume cs:codesg

datas segment
   db 'conversation'
datas ends

codesg segment
start: mov ax,datas
       mov ds,ax
       mov si,0
       mov cx,12

   s:  call con
       mov [si],al
       inc si
       loop s
       
       mov ax,4c00h
       int 21h

  con: mov al,[si]
       mov bl,11011111b
       and al,bl
       ret

       
codesg ends
end start