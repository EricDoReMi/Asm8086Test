'���ƣ�divdw
'���ܣ����в����������ĳ������㣬������Ϊdword�ͣ�����Ϊword�ͣ����Ϊdword��
'������(ax)=dword�����ݵĵ�16λ
'      (dx)=dword�����ݵĸ�16λ
'      (cx)=����
'���أ�(dx)=����ĸߵ�16λ��(ax)=����ĵ͵�16λ
'      (cx)=����
'Ӧ�þ����ˣ�����1000000/10(F4240H/0AH)
'�����(dx)=0001H��(ax)=86A0H��(cx)=0

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