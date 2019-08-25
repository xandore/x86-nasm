; C equivalent 
; uname char[20];
; int _main(void){
;	printf("Hello, what is your name?!");
;	scanf("%s",uname)
;	printf("Hi, %s",uname)
;}

global _main
extern _printf
extern _scanf

section .bss
	uname: resd 20
	 
section .data
	msg db "Hello, whats your name?!",10,0
	fmt db "%s",10,0
	msga db "Hi %s",10,0
_main:
	push ebp		;keep base pointer
	mov ebp,esp		;stack pointer into ebp
	pushad			;Push all gp regs to the stack

	push msg		;place msg on top of stack
	call _printf	;write msg to screen
	add esp,4		;remove params from stack
	
	push uname		;store name in uanme 
	push fmt		;format for name
	call _scanf		;get nme
	add esp,8 		;remove params from stack
	
	push uname		;print name
	push msga		;In msga format
	call _printf	;Print
	add esp,8		;remove params from stack


	