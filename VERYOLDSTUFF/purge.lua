local howOldInSeconds = 1
local script1,script2='',''

if cheatEngineIs64Bit() then
  script1=[[aobscanmodule(ScanFilesOlderThan_64bit,cheatengine-x86_64.exe,48 3D 00 A3 02 00)
registersymbol(ScanFilesOlderThan_64bit)
alloc(newmem,$1000,cheatengine-x86_64.exe)
label(return)

newmem:
  cmp rax,#{timespan}
  jmp return

ScanFilesOlderThan_64bit:
  jmp newmem
  nop
return:]]
  script2=[[ScanFilesOlderThan_64bit:
db 48 3D 00 A3 02 00]]
else
  script1=[[aobscanmodule(ScanFilesOlderThan_32bit,cheatengine-i386.exe,3D 00 A3 02 00)
registersymbol(ScanFilesOlderThan_32bit)
alloc(newmem,$1000,cheatengine-i386.exe)
label(return)

newmem:
  cmp eax,#{timespan}
  jmp return

ScanFilesOlderThan_32bit:
  jmp newmem
return:]]
  script2=[[ScanFilesOlderThan_32bit:
db 3D 00 A3 02 00]]
end

local function purge(t)
  t.destroy()
  autoAssemble(script1:gsub('{timespan}',howOldInSeconds), true)
  createMemScan().destroy()
  autoAssemble(script2, true)
end

createTimer().OnTimer = purge


