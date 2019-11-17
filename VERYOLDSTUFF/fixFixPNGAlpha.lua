if not cheatEngineIs64Bit() then
  local a=autoAssemble([[define(address,"cheatengine-i386.exe"+1D8853)
define(bytes,89 44 24 08 89 5C 24 04)
assert(address,bytes)
alloc(newmem,$1000)
label(return)

newmem:
  mov [esp+08],eax
  mov al,[esp+08]
  mov ah,[esp+0A]
  xchg al,ah
  mov [esp+08],al
  mov [esp+0A],ah
  mov [esp+04],ebx
  jmp return
address:
  jmp newmem
  nop
  nop
  nop
return:]],true)
  if not a then print'fixFixPNGAlpha: only CE6.6 (installer ver.6.6.0.1) supported' end

else
  local a=autoAssemble([[define(address,"cheatengine-x86_64.exe"+23732D)
define(bytes,89 C6 48 89 D9 48 89 D8 48 8B 00)
assert(address,bytes)
alloc(newmem,$1000,cheatengine-x86_64.exe)
label(return)

newmem:
  mov esi,eax
  and esi,ff00
  mov ecx,eax
  shr eax,10
  shl ecx,10
  movzx eax,al
  and ecx,ff0000
  or esi,eax
  or esi,ecx
  mov rcx,rbx
  jmp return

address:
  jmp newmem
return:]],true)
  if not a then print'fixFixPNGAlpha: only CE6.6 (installer ver.6.6.0.1) supported' end

end