assume cs:codesg

datas segment
      db 'conversation',0
datas ends

codesg segment
start: mov ax,datas
       mov ds,ax
       mov si,0
       int 7ch

       mov ax,4c00h
       int 21h

codesg ends

end start