local script = [[
[64-bit]
aobscanmodule(LoadXML_Epilogue,400000,55 48 89 CD 48 8D 64 24 E0 48 8D 0D xx xx xx xx E8 xx xx xx xx 48 83 BD xx xx xx xx 00) // should be unique
alloc(newmem,$1000,400000)
label(return)
label(timerObjectAddress)
registersymbol(timerObjectAddress)

newmem:
  push rbp

  mov rbp,[timerObjectAddress]
  cmp rbp,0
  jz @f

  mov [rbp+28],1 // set Tag field to one

@@:
  mov rbp,rcx
  lea rsp,[rsp-20]
  jmp return

timerObjectAddress:
dq 0

LoadXML_Epilogue:
  jmp newmem
  nop
  nop
  nop
  nop
return:
[/64-bit]

[32-bit]
aobscanmodule(LoadXML_Epilogue,400000,B8 xx xx xx xx E8 xx xx xx xx 83 BD xx xx xx xx 00) // should be unique
alloc(newmem,$1000)
label(return)
label(timerObjectAddress)
registersymbol(timerObjectAddress)

newmem:
  mov eax,[timerObjectAddress]
  cmp eax,0
  jz @f

  mov [eax+14],1 // set Tag field to one

@@:
  readmem(LoadXML_Epilogue,5)
  jmp return

timerObjectAddress:
dq 0

LoadXML_Epilogue:
  jmp newmem
return:
[/32-bit]
]]

local function dostuff(timer)
  if timer.Tag == 0 then return end

  -- force moManualExpandCollapse and moAllowManualCollapseAndExpand for all memrec with children and moHideChildren
  local al = getAddressList()
  for i=0,al.Count-1 do
    local mr = al[i]
    if mr.Count>=1 and mr.Options:match("moHideChildren") then
       mr.Options = mr.Options:sub(1,-2)..",moManualExpandCollapse,moAllowManualCollapseAndExpand]"
    end
  end

  timer.Tag = 0
end

if autoAssemble(script,true) then
  local timerObject = createTimer(MainForm,true)
  timerObject.Interval = 500
  timerObject.OnTimer = dostuff

  local timerObject_address = userDataToInteger(timerObject)
  writeQwordLocal("timerObjectAddress", timerObject_address)
end





