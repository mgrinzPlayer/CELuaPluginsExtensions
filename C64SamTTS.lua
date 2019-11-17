C64SamTTS_loaded = false

function C64SamTTS_init()
  if C64SamTTS_loaded then return true end

  local samLibrary = cheatEngineIs64Bit() and 'sam-x86_64' or 'sam-i686'
  local conventionP = cheatEngineIs64Bit() and '' or 'mov ecx,[esp+4]'
  local conventionE = cheatEngineIs64Bit() and 'ret' or 'ret 004'

  if autoAssemble([[
// sam.sayThis() compiled with 'fastcall' attribute, for both binaries, arguments should be in rcx,rdx (ecx,edx)
loadlibrary(autorun\dlls\]]..samLibrary..[[.dll)
loadlibrary(winmm.dll)

alloc(C64SamTTS,4096)

label(C64SamTTS_fillBufferWithSpeech)
registersymbol(C64SamTTS_fillBufferWithSpeech)

C64SamTTS:
C64SamTTS_fillBufferWithSpeech:
  ]]..conventionP..[[ // get parameter, 32bit mode
  lea rsp,[rsp-28]
  call ]]..samLibrary..[[.sayThis
  // rax has error code
  lea rsp,[rsp+28]
  ]]..conventionE,true)==false then print('assembling C64SamTTS failed') return false end

  C64SamTTS_loaded = true
  return true
end

C64SamTTS_tableWithBuffers = {}

function C64SamTTS_sayThis(text,waittilldone)
  if not C64SamTTS_init() then return end

  if C64SamTTS_tableWithBuffers[text]==nil then
    local memorystream = createMemoryStream()
    memorystream.Size = 1048576 -- allocate 1MB (about 47.55 seconds), do not worry, we reduce it later
    writeStringLocal(memorystream.Memory      , text)
    writeBytesLocal (memorystream.Memory+#text, 0)
    local errorcode = executeCodeLocal('C64SamTTS_fillBufferWithSpeech',memorystream.Memory)
    if errorcode~=0 then memorystream.destroy(); return end -- something bad happened, quit
    local size = readIntegerLocal(memorystream.Memory+4)+16
    memorystream.Size = size -- reduce size of memorystream (so another new memorystream can reuse this allocated memory)
    C64SamTTS_tableWithBuffers[text] = memorystream
  end

  playSound(C64SamTTS_tableWithBuffers[text],waittilldone)
end


--example
-- C64SamTTS_sayThis('this is, software automatic mouth, on cheat engine.')