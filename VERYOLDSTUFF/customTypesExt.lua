customTypesExt = {}
customTypesExt.msg='customTypesExt: only CE6.6 (installer ver.6.6.0.1) supported'
customTypesExt.customTypes = {}

customTypesExt.cs = createCriticalSection()
customTypesExt.CEis64Bit = cheatEngineIs64Bit()

function customTypesExt.getValue(customTypeIndexOrName, address)
  local customtype = customTypesExt.customTypes[customTypeIndexOrName]
  if customtype==nil then return nil end

  local realAddress=nil
  if type(address)=='string' and readInteger(address)~=nil then
    realAddress=getAddress(address)
  else
    realAddress = tonumber(address)
  end
  if realAddress==nil then return nil end

  local size = customtype.bytesize
  local bt=readBytes(realAddress,size,true)

  -- customTypeTypeLua
  if customtype.customTypeType==1 then
    bt[#bt+1]=realAddress
    return customtype.tovalue( unpack(bt) )
  end

  -- customTypeTypeAutoAssembler
  local scriptUsesCDecl = customtype.scriptUsesCDecl -- for 32bit CE
  local usesFloat = customtype.usesFloat

  customTypesExt.cs.enter()

  writeQwordLocal(customTypesExt.ms.Memory+0,customtype.routine)
  writeQwordLocal(customTypesExt.ms.Memory+8,realAddress)
  writeBytesLocal(customTypesExt.ms.Memory+24,bt)

  local value
  if customTypesExt.CEis64Bit then
    value = executeCodeLocal('customTypesExt_ConvRout_x86_64',customTypesExt.ms.Memory)
  else
    if scriptUsesCDecl then
      value = executeCodeLocal('customTypesExt_ConvRout_cdecl',customTypesExt.ms.Memory)
    else
      value = executeCodeLocal('customTypesExt_ConvRout_stdcall',customTypesExt.ms.Memory)
    end
  end

  customTypesExt.cs.leave()

  if usesFloat then
    return byteTableToFloat(dwordToByteTable(value))
  else
    return value
  end

end

function customTypesExt.setValue(customTypeIndexOrName, address, value)
  local customtype = customTypesExt.customTypes[customTypeIndexOrName]
  if customtype==nil then return nil end

  local realAddress=nil
  if type(address)=='string' and readInteger(address)~=nil then
    realAddress=getAddress(address)
  else
    realAddress = tonumber(address)
  end
  if realAddress==nil then return nil end

  -- customTypeTypeLua
  if customtype.customTypeType==1 then
    customtype.tobytes( value, realAddress )
    return
  end

  -- customTypeTypeAutoAssembler
  local size = customtype.bytesize
  local scriptUsesCDecl = customtype.scriptUsesCDecl -- for 32bit CE
  local usesFloat = customtype.usesFloat
  local bt=readBytes(realAddress,size,true)

  if usesFloat then
    value=byteTableToDword(floatToByteTable(value))
  end

  customTypesExt.cs.enter()

  writeQwordLocal(customTypesExt.ms.Memory+0,customtype.backroutine)
  writeQwordLocal(customTypesExt.ms.Memory+8,realAddress)
  writeQwordLocal(customTypesExt.ms.Memory+16,value)
  writeBytesLocal(customTypesExt.ms.Memory+24,bt)

  if customTypesExt.CEis64Bit then
    executeCodeLocal('customTypesExt_ConvBackRout_x86_64',customTypesExt.ms.Memory)
  else
    if scriptUsesCDecl then
      executeCodeLocal('customTypesExt_ConvBackRout_cdecl',customTypesExt.ms.Memory)
    else
      executeCodeLocal('customTypesExt_ConvBackRout_stdcall',customTypesExt.ms.Memory)
    end
  end

  bt=readBytesLocal(customTypesExt.ms.Memory+24,size,true)

  customTypesExt.cs.leave()

  writeBytes(realAddress,bt)
end

function customTypesExt.getCustomType(customTypeIndexOrName)
  return customTypesExt.customTypes[customTypeIndexOrName]
end

function customTypesExt.getCustomTypeCount()
  return customTypesExt.Count
end

function customTypesExt.refresh()
  customTypesExt.customTypes = {}
  local o = customTypesExt.offsets
  local maxsize = 0

  local customTypesArray = readPointerLocal(customTypesExt.customTypesArrayAddr)
  local customTypesCount = readIntegerLocal(customTypesExt.customTypesCountAddr)

  if not (customTypesArray and customTypesCount) then print(customTypesExt.msg) return end

  if customTypesExt.ms==nil then
    customTypesExt.ms = createMemoryStream()
  end

  for i=0,customTypesCount-1 do
    local customtype = {}
    local index = i + 1
    customTypesExt.customTypes[index] = customtype
    local base = readPointerLocal(customTypesArray+i*o.pointersize)
    -- common
    customtype.base = base
    customtype.name            = readStringLocal(readPointerLocal(base+o.name))
    customtype.bytesize        = readIntegerLocal(base+o.bytesize)
    customtype.customTypeType  = readBytesLocal(base+o.customTypeType,1)
    -- customTypeTypeAutoAssembler
    if customtype.customTypeType==0 then
    customtype.usesFloat       = readBytesLocal(base+o.usesFloat,1)~=0
    customtype.scriptUsesCDecl = readBytesLocal(base+o.scriptUsesCDecl,1)~=0
    customtype.alignment       = readIntegerLocal(base+o.alignment)
    customtype.routine         = readPointerLocal(base+o.routine)
    customtype.backroutine     = readPointerLocal(base+o.backroutine)
    -- customTypeTypeLua
    elseif customtype.customTypeType==1 then
    customtype.tovalue         = getRef(readIntegerLocal(base+o.lua_bytestovaluefunctionid))
    customtype.tobytes         = getRef(readIntegerLocal(base+o.lua_valuetobytesfunctionid))
    -- ^^ Lua
    end

    customTypesExt.customTypes[customtype.name] = customtype     -- we can use type name too
    customtype.getValue = function (address) return customTypesExt.getValue(index,address) end
    customtype.setValue = function (address, v) return customTypesExt.setValue(index,address,v) end

    if maxsize<customtype.bytesize then maxsize=customtype.bytesize end
  end
  customTypesExt.Count = customTypesCount

  customTypesExt.cs.enter()
  customTypesExt.ms.Size = maxsize + 24
  customTypesExt.cs.leave()
end

function customTypesExt.Init()
  if not (getCEVersion()==6.6) then print(customTypesExt.msg) return end

  if cheatEngineIs64Bit() then
    customTypesExt.offsets = {name=0x8, routine=0x30, backroutine=0x38,
                              lua_bytestovaluefunctionid=0x18,
                              lua_valuetobytesfunctionid=0x1C,
                              customTypeType=0x50, usesFloat=0x51, scriptUsesCDecl=0x52,
                              bytesize=0x54, alignment=0x58, pointersize=8}

    --local X = readPointerLocal'cheatengine-x86_64.exe+00A7EE60' -- SVN
    local X = readPointerLocal'cheatengine-x86_64.exe+00A7CE60'
    if X==nil then print(customTypesExt.msg) return end
    X = readPointerLocal(X+8)
    if X==nil then print(customTypesExt.msg) return end
    customTypesExt.customTypesArrayAddr = X+0x8
    customTypesExt.customTypesCountAddr = X+0x10
  else
    customTypesExt.offsets = {name=0x4, routine=0x1C, backroutine=0x20,
                              lua_bytestovaluefunctionid=0x0C,
                              lua_valuetobytesfunctionid=0x10,
                              customTypeType=0x2C, usesFloat=0x2D, scriptUsesCDecl=0x2E,
                              bytesize=0x30, alignment=0x34, pointersize=4}

    --local X = readPointerLocal'cheatengine-i386.exe+00745620'  -- SVN
    local X = readPointerLocal'cheatengine-i386.exe+0077D620'
    if X==nil then print(customTypesExt.msg) return end
    X = readPointerLocal(X+4)
    if X==nil then print(customTypesExt.msg) return end
    customTypesExt.customTypesArrayAddr = X+0x4
    customTypesExt.customTypesCountAddr = X+0x8
  end


  if not autoAssemble([[alloc(newmem,2048)
                        label(customTypesExt_ConvRout_stdcall)
                        registersymbol(customTypesExt_ConvRout_stdcall)  // 32bit

                        label(customTypesExt_ConvRout_cdecl)
                        registersymbol(customTypesExt_ConvRout_cdecl)    // 32bit

                        label(customTypesExt_ConvRout_x86_64)
                        registersymbol(customTypesExt_ConvRout_x86_64)   // 64bit

                        label(customTypesExt_ConvBackRout_stdcall)
                        registersymbol(customTypesExt_ConvBackRout_stdcall)  // 32bit

                        label(customTypesExt_ConvBackRout_cdecl)
                        registersymbol(customTypesExt_ConvBackRout_cdecl)    // 32bit

                        label(customTypesExt_ConvBackRout_x86_64)
                        registersymbol(customTypesExt_ConvBackRout_x86_64)   // 64bit

                        newmem:
                        customTypesExt_ConvRout_x86_64:
                        mov rax,[rcx+0]
                        mov rdx,[rcx+8]
                        lea rcx,[rcx+18]
                        call rax
                        ret

                        customTypesExt_ConvRout_cdecl:
                        mov eax,[esp+4]
                        push [eax+8]
                        lea eax,[eax+18]
                        push eax
                        call [eax-18]
                        lea esp,[esp+8]
                        ret 4

                        customTypesExt_ConvRout_stdcall:
                        mov eax,[esp+4]
                        lea eax,[eax+18]
                        push eax
                        call [eax-18]
                        ret 4


                        //BACK

                        customTypesExt_ConvBackRout_x86_64:
                        mov rax,[rcx+0]
                        mov rdx,[rcx+8]
                        //lea r8,[rcx+18]
                        db 4C 8D 41 18
                        mov ecx,[rcx+10]
                        call rax
                        ret

                        customTypesExt_ConvBackRout_cdecl:
                        mov eax,[esp+4]
                        lea eax,[eax+18]
                        push eax
                        lea eax,[eax-18]
                        push [eax+8]
                        push [eax+10]
                        call [eax]
                        lea esp,[esp+C]
                        ret 4

                        customTypesExt_ConvBackRout_stdcall:
                        mov eax,[esp+4]
                        lea eax,[eax+18]
                        push eax
                        lea eax,[eax-18]
                        push [eax+10]
                        call [eax]
                        ret 4

                        ]],true) then print'customTypesExt: AA assembling fail' end
    customTypesExt.refresh()
end

customTypesExt.Init()

readCustom = customTypesExt.getValue
writeCustom = customTypesExt.setValue
getCustomType = customTypesExt.getCustomType
getCustomTypeCount = customTypesExt.getCustomTypeCount
