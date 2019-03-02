'名称：divdw
'功能：进行不会产生溢出的除法运算，被除数为dword型，除数为word型，结果为dword型
'参数：(ax)=dword型数据的低16位
'      (dx)=dword型数据的高16位
'      (cx)=除数
'返回：(dx)=结果的高的16位，(ax)=结果的低的16位
'      (cx)=余数
'应用举例了：计算1000000/10(F4240H/0AH)
'结果：(dx)=0001H，(ax)=86A0H，(cx)=0

assume cs:codesg

stack segment
      dw 8 dup(0)
stack ends

codesg segment

start: mov ax,stack
       mov ss,ax
       mov sp,16
       mov ax,4240h
       mov dx,000fh
       mov cx,0ah

       call divdw

       mov ax,4c00h
       int 21h

divdw: push ax
       mov ax,dx
       mov dx,0
       div cx
       mov bx,ax
       pop ax
       div cx
       mov cx,dx
       mov dx,bx
       ret

codesg ends

end start