;Handy Single byte instructions
;Refrence: Next Generation Security Software Ltd - Writing Small Shellcode

xchg eax,ebx;Swaps the contents of eax and another register

lodsd/lodsb	;Loads the dword/byte pointed to by esi into eax/al, and increments esi  

stosd/stosb	;Saves the dword/byte in eax/al at the address pointed to by edi, and increments edi
	
pushad/popad;saves/restores all registers to/from the stack
	
cdq			;Extends eax into a quad-word using edx – this can be used to set edx = null if we know that eax < 0x80000000