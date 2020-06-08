global add:function

; int __fastcall add(int x, int y)
;
;    ecx: x
;    edx: y
add:
	mov eax, ecx
	add eax, edx ; x + y
	ret
