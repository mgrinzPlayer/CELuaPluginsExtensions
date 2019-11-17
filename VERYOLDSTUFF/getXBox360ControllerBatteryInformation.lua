function initializeGetXBox360ControllerBatteryInformation()
  if initializeGetXBox360ControllerBatteryInformation_initialized then return true end

  --reinitializeSelfSymbolhandler()
  --local XInputGetBatteryInformationAddr = getAddressSafe('XInputGetBatteryInformation',true)

  if --(XInputGetBatteryInformationAddr~=nil) and
     autoAssemble([[alloc(getXBox360ControllerBatteryInformation,2048)
label(XINPUT_BATTERY_INFORMATION)
label(XBox360ControllerBatteryType)
label(XBox360ControllerBatteryLevel)
registersymbol(getXBox360ControllerBatteryInformation)
registersymbol(XBox360ControllerBatteryType)
registersymbol(XBox360ControllerBatteryLevel)

getXBox360ControllerBatteryInformation:
sub rsp,28
//mov rcx,index
mov rdx,0 // devType
mov r8,XINPUT_BATTERY_INFORMATION
call XInputGetBatteryInformation
add rsp,28
ret

XINPUT_BATTERY_INFORMATION:
XBox360ControllerBatteryType:
db 0
XBox360ControllerBatteryLevel:
db 0]],true)
  then
    initializeGetXBox360ControllerBatteryInformation_initialized = true
    return true
  else
    return false
  end
end

function getXBox360ControllerBatteryInformation(index)
  if not initializeGetXBox360ControllerBatteryInformation() then
    return {BatteryType=-1, BatteryLevel=-1, StatusString='"XInputGetBatteryInformation" missing'}
  end

  if index==nil then
    local state = getXBox360ControllerState()
    index = state and state.ControllerID or 0
  end

  local result = executeCodeLocal('getXBox360ControllerBatteryInformation',index)

  if result~=0 then
    return {BatteryType=-1, BatteryLevel=-1, StatusString='"XInputGetBatteryInformation" error'}
  end

  local BatteryType = readBytesLocal('XBox360ControllerBatteryType',1)
  local BatteryLevel = readBytesLocal('XBox360ControllerBatteryLevel',1)

  local BatteryTypeStrings = {'Disconnected','Wired','Type: Alkaline',
                              'Type: NiMH',[256]='Type: Unknown'}

  local StatusString = BatteryTypeStrings[BatteryType+1] or ('Type: '..BatteryType)

  local BatteryLevelStrings = {'Level: Empty', 'Level: Low',
                               'Level: Medium','Level: Full'}

  if BatteryType>=2 then
    StatusString = StatusString..' '..(BatteryLevelStrings[BatteryLevel+1] or 'Level: Unknown')
  end

  return {BatteryType=BatteryType, BatteryLevel=BatteryLevel, StatusString=StatusString}
end

