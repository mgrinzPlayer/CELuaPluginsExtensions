BigEndianDouble = [[

alloc(TypeName,256)
alloc(ByteSize,4)
alloc(ConvertRoutine,1024)
alloc(ConvertBackRoutine,1024)
alloc(UsesFloat,4)
alloc(PreferedAlignment,4)
alloc(TEMPVAL,8)

TypeName:
db 'Big Endian Double',0
ByteSize:
dd 08
UsesFloat:
dd 01
PreferedAlignment:
dd 04
TEMPVAL:
dq 00

ConvertRoutine:
[32-bit]
push ebp
mov ebp,esp
xor edx,edx

//[ebp+8]=input
//example:
mov eax,[ebp+8] //place the address that contains the bytes into eax
mov eax,[eax]
bswap eax
mov [TEMPVAL+4],eax

mov eax,[ebp+8] //place the address that contains the bytes into eax
mov eax,[eax+4]
bswap eax
mov [TEMPVAL],eax

finit
fld qword ptr [TEMPVAL]
fstp dword ptr [TEMPVAL]
mov eax,[TEMPVAL]

pop ebp
ret 4
[/32-bit]

[64-bit]
//rcx=address of input
mov rcx,[rcx] //rcx now contains the bytes 'input' pointed to
bswap rcx
mov [TEMPVAL],rcx

finit
fld qword ptr [TEMPVAL]
fstp dword ptr [TEMPVAL]
mov eax,[TEMPVAL]

ret
[/64-bit]

ConvertBackRoutine:
[32-bit]
push ebp
mov ebp,esp
//[ebp+8]=input
//[ebp+c]=address of output
//example:
push eax
push ebx
mov ebx,[ebp+c] //load the address into ebx

finit
fld dword ptr [ebp+8]
fstp qword ptr [TEMPVAL]

mov eax,[TEMPVAL+4]
bswap eax
mov [ebx],eax //write the value into the address

mov eax,[TEMPVAL]
bswap eax
mov [ebx+4],eax //write the value into the address

pop ebx
pop eax

pop ebp
ret 8
[/32-bit]

[64-bit]
//ecx=input
//rdx=address of output
mov [TEMPVAL],ecx

finit
fld dword ptr [TEMPVAL]
fstp qword ptr [TEMPVAL]

mov rax,[TEMPVAL]
bswap rax

mov [rdx],rax //place the integer the 4 bytes pointed to by rdx
ret
[/64-bit]
]]



BigEndianSingle = [[
alloc(TypeName,256)
alloc(ByteSize,4)
alloc(ConvertRoutine,1024)
alloc(ConvertBackRoutine,1024)
alloc(UsesFloat,4)

TypeName:
db 'Big Endian Single',0
ByteSize:
dd 4
UsesFloat:
db 01

ConvertRoutine:
[32-bit]
push ebp
mov ebp,esp
xor edx,edx

mov eax,[ebp+8] //place the address that contains the bytes into eax
mov eax,[eax]   //place the bytes into eax
bswap eax
pop ebp
ret 4
[/32-bit]

[64-bit]
//rcx=address of input
mov eax,[rcx] //eax now contains the bytes 'input' pointed to
bswap eax
ret
[/64-bit]

ConvertBackRoutine:
[32-bit]
push ebp
mov ebp,esp
//[ebp+8]=input
//[ebp+C]=address of output
push eax
push ebx
mov eax,[ebp+8] //load the value into eax
mov ebx,[ebp+C] //load the address into ebx
bswap eax
mov [ebx],eax //write the value into the address
pop ebx
pop eax

pop ebp
ret 8
[/32-bit]

[64-bit]
//ecx=input
//rdx=address of output
bswap ecx
mov [rdx],ecx //place the integer the 4 bytes pointed to by rdx
ret
[/64-bit]
]]



CountSetBits4byte = [[
alloc(ConvertRoutine,1024)
alloc(TypeName,256)
alloc(ByteSize,4)

TypeName:
db 'CountSetBits 4byte',0

ByteSize:
dd 4


ConvertRoutine:
[32-bit]
push ebp
mov ebp,esp
mov eax,[ebp+8]
mov eax,[eax]
[/32-bit]

[64-bit]
mov eax,[rcx]
push ebx
[/64-bit]

mov ebx,eax
shr ebx,1
and eax,55555555
and ebx,55555555
add eax,ebx

mov ebx,eax
shr ebx,2
and eax,33333333
and ebx,33333333
add eax,ebx

mov ebx,eax
shr ebx,4
add eax,ebx
and eax,0F0F0F0F

mov ebx,eax
shr ebx,8
add eax,ebx

mov ebx,eax
shr ebx,10
add eax,ebx

and eax,3F

[32-bit]
pop ebp
ret 4
[/32-bit]

[64-bit]
pop ebx
ret
[/64-bit]
]]

CountSetBits8byte = [[
alloc(ConvertRoutine,1024)
alloc(TypeName,256)
alloc(ByteSize,4)
alloc(PREFEREDALIGNMENT,4)

TypeName:
db 'CountSetBits 8byte',0

ByteSize:
dd 8

PREFEREDALIGNMENT:
dd 4

label(dat55)
label(dat33)
label(dat0f)


ConvertRoutine:
[32-bit]
push ebp
mov ebp,esp
mov eax,[ebp+8]

movq  mm0,[eax]

movq  mm1,mm0
psrlq mm1,01
pand  mm0,[dat55]
pand  mm1,[dat55]
paddq mm0,mm1

movq  mm1,mm0
psrlq mm1,02
pand  mm0,[dat33]
pand  mm1,[dat33]
paddq mm0,mm1

movq  mm1,mm0
psrlq mm1,04
paddq mm0,mm1
pand  mm0,[dat0f]

movq  mm1,mm0
psrlq mm1,08
paddq mm0,mm1

movq  mm1,mm0
psrlq mm1,10
paddq mm0,mm1

movq  mm1,mm0
psrlq mm1,20
paddq mm0,mm1

movd eax,mm0
and eax,7f

pop ebp
ret 4
[/32-bit]

[64-bit]
push rbx

mov rax,[rcx]

mov rbx,rax
shr rbx,1
and rax,[dat55]
and rbx,[dat55]
add rax,rbx

mov rbx,rax
shr rbx,2
and rax,[dat33]
and rbx,[dat33]
add rax,rbx

mov rbx,rax
shr rbx,4
add rax,rbx
and rax,[dat0f]

mov rbx,rax
shr rbx,8
add rax,rbx

mov rbx,rax
shr rbx,10
add rax,rbx

mov rbx,rax
shr rbx,20
add rax,rbx

and rax,7f

pop rbx
ret
[/64-bit]

ConvertRoutine+300:
dat55:
dq 5555555555555555
dat33:
dq 3333333333333333
dat0f:
dq 0f0f0f0f0f0f0f0f
]]

normvector3Dupdownaxis = [[
alloc(ConvertRoutine,1024)
alloc(ConvertBackRoutine,1024)
alloc(TypeName,256)
alloc(ByteSize,4)
alloc(UsesFloat,1)
alloc(PREFEREDALIGNMENT,4)

label(val1_0001)
label(val0_9999)
label(epilog)
label(wrong)

TypeName:
db 'norm vector 3D - updown axis',0

ByteSize:
dd (int)12

UsesFloat:
db 1

PREFEREDALIGNMENT:
dd 4

ConvertRoutine:
[64-bit]
define(src,rcx)
define(dst,rax)
[/64-bit]
[32-bit]
define(src,eax)
define(dst,eax)
push ebp
mov ebp,esp
mov eax,[ebp+8] //place the address that contains the bytes into eax
[/32-bit]

movd xmm15,[src+8]
//movlhps xmm15,xmm15
db 45 0F 16 FF

movq xmm15,[src]

mulps xmm15,xmm15
movaps xmm14,xmm15
shufps xmm15,xmm15,E1
addss xmm14,xmm15
movhlps xmm15,xmm15
addss xmm14,xmm15
sqrtss xmm14,xmm14

comiss xmm14,[val1_0001]
ja short wrong
comiss xmm14,[val0_9999]
jb short wrong

mov dst,[src+8]
jmp short epilog


wrong:
mov dst,(float)NaN


epilog:
[32-bit]
pop ebp
ret 4
[/32-bit]
ret

val1_0001:
dd (float)1.0001

val0_9999:
dd (float)0.9999
]]


objectsclosetome = [[
define(playerPosAddress,1C0C4588)


alloc(ConvertRoutine,2048)
alloc(ConvertBackRoutine,1024)
alloc(TypeName,256)
alloc(ByteSize,4)
alloc(UsesFloat,1)
alloc(PREFEREDALIGNMENT,4)

TypeName:
db 'objects close to me',0

ByteSize:
dd (int)12

UsesFloat:
db 1

PREFEREDALIGNMENT:
dd 4


alloc(distanceFromPlayer,8)
distanceFromPlayer:
dd (float)1.5

label(distNotSmallerThan)
distNotSmallerThan:
dd (float)0.0001

label(notThis)
label(end)


label(playerPositionCopy)


ConvertRoutine:
[64-bit]
define(src,rcx)
[/64-bit]

[32-bit]
define(src,eax)
push ebp
mov ebp,esp
mov eax,[ebp+8]
[/32-bit]


// 64bit CE
[64-bit]
push rcx
push rdx
push r8
push r9
push r10
push r11
lea rsp,[rsp-28]


mov rcx,[cheatengine-x86_64.exe+94D630]
mov rcx,[rcx+10]                             // ProcessHandle
mov rdx,playerPosAddress
mov  r8,playerPositionCopy
mov r9d,00000010                             // size
mov qword ptr [rsp+20],00
call qword ptr [cheatengine-x86_64.exe+94CDC0]


lea rsp,[rsp+28]
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx

test eax,eax
jz short notThis
[/64-bit]



fld [src]
fsub [playerPositionCopy]
fmul ST(0),ST(0)
fld [src+4]
fsub [playerPositionCopy+4]
fmul ST(0),ST(0)
faddp
fld [src+8]
fsub [playerPositionCopy+8]
fmul ST(0),ST(0)
faddp
fsqrt

fld [distNotSmallerThan]
fcomip ST(0),ST(1)                // ST(0)=0.0001    ST(1)=calculated distance
ja short notThis


fld [distanceFromPlayer]
fcomip ST(0),ST(1)                // ST(0)=maxDist   ST(1)=calc dist
jb short notThis

push eax
fstp [esp]
pop eax
jmp short end


notThis:
fstp ST(0)
mov eax,FFC00000

end:


[64-bit]
ret
[/64-bit]

[32-bit]
pop ebp
ret 4
[/32-bit]

playerPositionCopy:
]]

RadToDegsingle = [[
alloc(ConvertRoutine,128)
alloc(ConvertBackRoutine,128)
alloc(TypeName,256)
alloc(ByteSize,4)
alloc(UsesFloat,1)

TypeName:
db 'RadToDeg (single-fp)',0
// single-precision floating-point value

ByteSize:
dd 4

UsesFloat:
db 1

ConvertRoutine:
[64-bit]
cvtss2sd xmm0,dword ptr[rcx]
[/64-bit]
[32-bit]
mov eax,[esp+04]
cvtss2sd xmm0,dword ptr[eax]
[/32-bit]

mov eax,#180
cvtsi2sd  xmm1,eax
mulsd xmm0,xmm1
fldpi
sub esp,8
db DD 1C 24 // fstp qword ptr [esp], fstp qword ptr [rsp]
divsd xmm0,[esp]
add esp,8
cvtsd2ss xmm0,xmm0
movd eax,xmm0

[64-bit]
ret
[/64-bit]
[32-bit]
ret 0004
[/32-bit]

ConvertBackRoutine:
[64-bit]
movd xmm0,ecx
[/64-bit]
[32-bit]
push ecx
mov ecx,[esp+08]
movd xmm0,ecx
[/32-bit]

cvtss2sd xmm0,xmm0
mov ecx,#180
cvtsi2sd  xmm1,ecx
divsd xmm0,xmm1
fldpi
sub esp,8
fstp qword ptr [esp] // db DD 1C 24 // fstp qword ptr [esp], fstp qword ptr [rsp]
mulsd xmm0,[esp]
add esp,8
cvtsd2ss xmm0,xmm0

[64-bit]
movd [rdx],xmm0
ret
[/64-bit]
[32-bit]
mov ecx,[esp+0C]
movd [ecx],xmm0
pop ecx
ret 0008
[/32-bit]
]]

Single1e8 = [[
alloc(TypeName,256)
alloc(ByteSize,4)
alloc(ConvertRoutine,1024)
alloc(UsesFloat,4)

label(maxValue)
label(minValue)

TypeName:
db 'Single (-1e8, 1e8)',0
ByteSize:
dd 4
UsesFloat:
db 01

ConvertRoutine:
[32-bit]
push ebp
mov ebp,esp
mov eax,[ebp+8]
mov eax,[eax]
[/32-bit]
[64-bit]
mov eax,[rcx]
[/64-bit]

movd xmm15,eax
comiss xmm15,[maxValue]
ja @f
comiss xmm15,[minValue]
jb @f
ret

@@:
mov eax,(float)NaN

[32-bit]
pop ebp
ret 4
[/32-bit]
[64-bit]
ret
[/64-bit]


maxValue:
dd (float)1e8

minValue:
dd (float)-1e8
]]

--[[
registerCustomTypeAutoAssembler(BigEndianDouble)
registerCustomTypeAutoAssembler(BigEndianSingle)
registerCustomTypeAutoAssembler(CountSetBits4byte)
registerCustomTypeAutoAssembler(CountSetBits8byte)
registerCustomTypeAutoAssembler(normvector3Dupdownaxis)
registerCustomTypeAutoAssembler(objectsclosetome)
registerCustomTypeAutoAssembler(RadToDegsingle)
registerCustomTypeAutoAssembler(Single1e8)
--]]
