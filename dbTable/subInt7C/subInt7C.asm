;��װһ���µ�int7ch���ж����̣�Ϊ��ʾ����ṩ���¹��ܵ��ӳ���
;(1)����
;(2)����ǰ��ɫ
;(3)���ñ���ɫ
;(4)���Ϲ���һ��
;��ah�Ĵ������ݹ��ܺţ�0������  1������ǰ��ɫ  2�����ñ���ɫ  3����ʾ���Ϲ���һ��
;����2,3�Ź��ܣ���al������ɫֵ��al ���� 0,1,2,3,4,5,6,7

assume cs:codesg
stack segment
      db 128 dup(0)
stack ends


codesg segment

start:mov ax,stack
      mov ss,ax
      mov sp,128

       push cs
       pop ds

      mov si,offset screenset
      
      mov ax,0
      mov es,ax
      mov di,204h
      mov cx,offset screensetOff - offset screenset

      cld
      rep movsb

      push es:[7ch*4]
      pop  es:[200h]
      push es:[7ch*4+2]
      pop  es:[202h]

      cli

      mov word ptr es:[7CH*4],204H
      mov word ptr es:[7CH*4+2],0

      sti

      
       mov ax,4c00h
       int 21h


org 204H;αָ���ʾ��һ����ַ��ƫ�Ƶ�ַ204H��ʼ���Ͱ�װ���ƫ�Ƶ�ַ��ͬ����û��org 204H���ж����̰�װ�󣬱�Ŵ���ĵ�ַ�ı��ˣ���֮ǰ�������������������
 screenset:
      jmp short screenSt
      table dw sub1,sub2,sub3,subF
      
      

 screenSt:push bx
       cmp ah,3
       ja screensetEnd

       mov bl,ah
       mov bh,0
       add bl,bl

       call word ptr table[bx]
   
screensetEnd:pop bx
             iret

       

  sub1:push ax
       push bx
       push cx
       push es

       mov ax,0b800h
       mov es,ax
       mov bx,0
       mov cx,2000

 sub1S:mov byte ptr es:[bx],' '
       add bx,2
       loop sub1S
       
       pop es
       pop cx
       pop bx
       pop ax
       ret
       
  sub2:push ax
       push bx
       push cx
       push es

       mov bx,0b800h
       mov es,bx
       mov bx,1
       mov cx,2000

 sub2S:and byte ptr es:[bx],11111000b
       or es:[bx],al
       add bx,2
       loop sub2S

       pop es
       pop cx
       pop bx
       pop ax

       ret

  sub3:push ax
       push bx
       push cx
       push es
     
       mov cl,4
       shl al,cl

       mov bx,0b800h
       mov es,bx
       mov bx,1
       mov cx,2000

 sub3S:and byte ptr es:[bx],1000111b
       or es:[bx],al
       add bx,2
       loop sub3S

       pop es
       pop cx
       pop bx
       pop ax

       ret

  subF:push ax
       push bx
       push cx
       push es
       push si
       push di
       
       mov bx,0b800h
       mov ds,bx
       mov es,bx

       mov si,160
       mov di,0
       
       cld
       mov cx,24
       
  subFS:push cx
	mov cx,160
	rep movsb
	pop cx
        loop subFS 
        
	mov bx,0
        mov cx,80
	

 subFEd:mov byte ptr [160*24+bx],' '
        add bx,2
	loop subFEd

	pop di
	pop si
	pop es
	pop cx
	pop bx
	pop ax
	ret

screensetOff:nop
codesg ends
end start