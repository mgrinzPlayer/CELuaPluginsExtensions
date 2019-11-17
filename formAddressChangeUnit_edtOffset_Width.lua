if cheatEngineIs64Bit() then
local script=[[
aobscanmodule(edtOffset_GetTextWidth,00400000,48 8D 15 xx xx xx xx E8 xx xx xx xx 89 C2 48 8B 4B 38 E8)
aobscanmodule(baseAddress_ClientWidth,00400000,48 8B 45 E8 48 8B 88 F8 05 00 00 8B 55 E4)
aobscanmodule(editAddress_ClientWidth,00400000,67 8D 14 30 48 8B 8B 4x 08 00 00)

alloc(newmem,$1000,00400000)
label(code1)
label(code2)
label(code3)
label(return1)
label(return2)
label(return3)

newmem:
code1:
  imul eax,eax,8  // multiply by 8
  mov edx,eax
  mov rcx,[rbx+38]
  jmp return1
code2:
  mov rax,[rbp-18]
  mov rcx,[rax+000005F8]
  mov edx,[rbp-1C]
  imul edx,edx,2  // multiply by 2
  jmp return2+3
code3:
  imul eax,eax,4  // multiply by 4
  lea edx,[rax+esi]
  reassemble(editAddress_ClientWidth+4)
  jmp return3
calcWidth:
  dd 0

edtOffset_GetTextWidth+C:
  jmp code1
  nop
return1:

baseAddress_ClientWidth:
  jmp code2
  nop
  nop
  nop
  nop
  nop
  nop
return2:

editAddress_ClientWidth:
  jmp code3
  nop
  nop
  nop
  nop
  nop
  nop
return3:
]]
autoAssemble(script,true)
else
local script=[[aobscanmodule(edtOffset_GetTextWidth,00400000,BA xx xx xx xx E8 xx xx xx xx 89 C2 8B 43 1C E8)
alloc(newmem,$1000)
label(return)

newmem:
  imul eax,eax,8  // multiply calculated value by 8
  mov edx,eax
  mov eax,[ebx+1C]
  jmp return

edtOffset_GetTextWidth+A:
  jmp newmem
return:]]
autoAssemble(script,true)
end

