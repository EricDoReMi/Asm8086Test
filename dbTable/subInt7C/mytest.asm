assume cs:codesg

codesg segment
 start:mov ax,102h
       int 7ch
       
       mov ax,4c00h
       int 21h
codesg ends
end start