--AOBSCANOPTIMIZER COMMON PART START
local function tohex(n) return string.format("%08X",n) end

local moduleInfos = {}
local function getModuleStartAndSize(moduleName)
  local moduleAddress,moduleSize
  if moduleInfos[moduleName]==nil then
    moduleAddress = getAddressSafe(moduleName)
    if moduleAddress==nil then return 0,0 end
    moduleSize = getModuleSize(moduleName)
    moduleSize = ((moduleSize // 4096) + 1) * 4096
    moduleInfos[moduleName] = {}
    moduleInfos[moduleName].moduleAddress=moduleAddress
    moduleInfos[moduleName].moduleSize=moduleSize
    return moduleAddress,moduleSize
  end
  return moduleInfos[moduleName].moduleAddress,moduleInfos[moduleName].moduleSize
end

local sections = {}
local function collectSections()
  if #sections>0 then return sections end
  local MainModule = enumModules()[1]
  local MainModuleAddress = MainModule.Address
  local COFF_FileHeader = MainModuleAddress + readInteger(MainModuleAddress+0x3C)
  local NumberOfSections =  readSmallInteger(COFF_FileHeader+0x6)
  local SizeOfOptionalHeader = readSmallInteger(COFF_FileHeader+0x14)
  local FirstSectionHeader = COFF_FileHeader + 0x18 + SizeOfOptionalHeader
  local LastSectionHeader = FirstSectionHeader + 0x28 * ( NumberOfSections - 1 )
  for sectionHeader=FirstSectionHeader,LastSectionHeader,0x28 do
    local name = readString(sectionHeader,8)
    local virtualSize = (((readInteger(sectionHeader + 0x8))//4096)+1)*4096 -- round up
    local virtualOffset = readInteger(sectionHeader + 0xC)
    local characteristics = readInteger(sectionHeader + 0x24)
    local lowAddress = virtualOffset + MainModuleAddress
    local highAddress = lowAddress + virtualSize
    if ( characteristics & 0x20000000 )==0x20000000 then -- only with MEM_EXECUTE
      sections[1+#sections] = {name = name, virtualSize = virtualSize, lowAddress = lowAddress, highAddress = highAddress}
    end
  end
  table.sort( sections, function (a,b) return a.virtualSize>b.virtualSize end )  -- biggest virtualSize first
  sections['biggestsection'] = sections[1]
  for _,v in ipairs(sections) do sections[v.name]=v end
  return sections
end

local function aobscanOptimizer(script,syntaxcheck)
  -- version 1.01
  -- if not syntaxcheck then print(script.Text) end
  local i=0
  local sections=nil
  local params1,params2=nil,nil
  while i<script.Count do
    params1 = script[i]:lower():match'aobscanmodule%(.-%)  //optim%(.-%)' and script[i]:match'%((.-)%)'
    params2 = script[i]:lower():match'aobscanmodule%(.-%)  //section%(.-%)' and script[i]:match'%((.-)%)'
    if params1 then
      local varName,moduleName,pattern = params1:match'%s*(.*%S)%s*,%s*(.*%S)%s*,%s*(.*%S)'
      local low,high = script[i]:lower():match'//optim%(%s*(.*%S)%s*,%s*(.*%S)%s*%)'
      local moduleAddress,moduleSize=getModuleStartAndSize(moduleName)
      low,high  = ((tonumber(low) or 0) * moduleSize + moduleAddress)//1, ((tonumber(high) or 0) * moduleSize + moduleAddress)//1
      low,high = tohex(low),tohex(high)
      script[i] = 'aobscanregion('..varName..','..low..','..high..','..pattern..')'
    end
    if params2 then
      local varName,moduleName,pattern = params2:match'%s*(.*%S)%s*,%s*(.*%S)%s*,%s*(.*%S)'
      local section = script[i]:lower():match'//section%(%s*(.*%S)%s*%)'
      if sections==nil then sections=collectSections() end
      if sections[section]~=nil then
        local low,high  = tohex(sections[section].lowAddress),tohex(sections[section].highAddress)
        script[i] = 'aobscanregion('..varName..','..low..','..high..','..pattern..')'
      end
    end
    i=i+1
  end
  -- if not syntaxcheck then print(script.Text) end
end

if aobscanOptimizerRegistered then unregisterAutoAssemblerPrologue(aobscanOptimizerRegistered);aobscanOptimizerRegistered=nil end
aobscanOptimizerRegistered = registerAutoAssemblerPrologue(aobscanOptimizer)
--AOBSCANOPTIMIZER COMMON PART END










-- OPTIMIZATOR - PREPARING - START
local AOBScanModuleOptimizer_AAPrologues_ENABLED = false
local optimizerMethod = 0 -- 0 = optim    ;  1 = section
local AOBScanModuleOptimizer_collectedData = {}
local AOBScanModuleOptimizer_redundancy = 0.1

--before aobscans
local function optimizerStage1(script,syntaxcheck)
  if not AOBScanModuleOptimizer_AAPrologues_ENABLED then return end
  if syntaxcheck then return end

  local i=0
  AOBScanModuleOptimizer_collectedData = {}

  while i<script.Count do
    local entry = {}
    entry.fullLine = script[i]
    entry.lineNumber = i
    local params = script[i]:lower():match'aobscanmodule%(.-%)' and script[i]:match'%((.-)%)'
    if params then
      local varName,moduleName,pattern = params:match'%s*(.*%S)%s*,%s*(.*%S)%s*,%s*(.*%S)'
      entry.params = {varName=varName,moduleName=moduleName,pattern=pattern}
      entry.fullLine = 'AOBScanModule('..params..')'
    end

    AOBScanModuleOptimizer_collectedData[1+#AOBScanModuleOptimizer_collectedData] = entry
    i=i+1
  end
end

--after aobscans
local function optimizerStage2(script,syntaxcheck)
  if not AOBScanModuleOptimizer_AAPrologues_ENABLED then return end
  if syntaxcheck then return end
  local sections=nil

  for i,v in ipairs(AOBScanModuleOptimizer_collectedData) do
    local params = script[v.lineNumber]:lower():match'define%(.*%)'
               and script[v.lineNumber]:match'%((.*)%)'
    if (params) and (v.params) then
      local varName,address = params:match'%s*(.*%S)%s*,%s*(.*%S)%s*'
      address = tonumber(address,16)

      if optimizerMethod==0 then --optim
        local moduleAddress,moduleSize=getModuleStartAndSize(v.params.moduleName)
        if (moduleSize>0) and (address>=moduleAddress) then
          local low = (((address-moduleAddress) / moduleSize) //0.001 *0.001 ) - AOBScanModuleOptimizer_redundancy
          low = (low < 0 ) and 0 or low
          local high = low + AOBScanModuleOptimizer_redundancy*2
          high = (high > 1 ) and 1 or high
          v.fullLine = v.fullLine..'  //OPTIM('..low..','..high..')'
        else
          v.fullLine = v.fullLine..'  //OPTIM not found'
        end

      else  -- section
        if sections==nil then sections=collectSections() end
        for ind,tab in ipairs(sections) do
          if (tab.lowAddress<=address) and (tab.highAddress>=address) then
            if ind==1 then
              v.fullLine = v.fullLine..'  //SECTION(BIGGESTSECTION)'
            else
              v.fullLine = v.fullLine..'  //SECTION('..tab.name..')'
            end
          end
        end
      end

    end
  end
end

optimizerStage1Registered = registerAutoAssemblerPrologue(optimizerStage1)
optimizerStage2Registered = registerAutoAssemblerPrologue(optimizerStage2,true)
-- OPTIMIZATOR - PREPARING - END










-- GUI STUFF START
local function regextrick(str)
  local s=''
  for c in str:gmatch('%w') do
    s=s..'['..c:lower()..c:upper()..']'
  end
  return s
end

local function addAOBScanModuleOptimizer_Click()
  local selMR=AddressList.SelectedRecord
  if selMR==nil then return end
  if selMR.Type~=vtAutoAssembler then messageDialog("only AutoAssembler types",mtError,mbClose) return end

  local WHOLESCRIPT = selMR.Script
  local enablePos1,enablePos2   = WHOLESCRIPT:find('%['..regextrick('enable')..'%]')
  local disablePos1,disablePos2 = WHOLESCRIPT:find('%['..regextrick('disable')..'%]')

  if (enablePos1==nil) or (disablePos1==nil) then messageDialog("missing [ENABLE] and/or [DISABLE] section",mtError,mbClose) return end
  if not WHOLESCRIPT:match(regextrick('aobscanmodule')..'%(.-%)') then messageDialog("there's no aobscanmodule command",mtError,mbClose) return end

  local sl=createStringList()
  sl.add('Fast')
  sl.add('Based on executable sections')
  local r,s = showSelectionList('AOBScanModuleOptimizer','Which method do you want to use?',sl,false)
  sl.destroy()
  if r==-1 then return end
  optimizerMethod = r

  local r = nil
  while (optimizerMethod==0) and (r==nil) do
    r=inputQuery('AOBScanModuleOptimizer', 'Please provide redundancy value. Values: 0.0001 - 1.0000\r\n0.1-0.3 should be OK', AOBScanModuleOptimizer_redundancy)
    r=tonumber(r)
    if (r==nil) or (r>1) or (r<=0) then r=nil end
    AOBScanModuleOptimizer_redundancy = r or AOBScanModuleOptimizer_redundancy
  end

  local oldAsyncState  = selMR.Async
  local oldDescription = selMR.Description

  if aobscanOptimizerRegistered then unregisterAutoAssemblerPrologue(aobscanOptimizerRegistered);aobscanOptimizerRegistered=nil end

  selMR.Async  = false
  selMR.Active = false
  selMR.Description = 'AOBScanModuleOptimizer: PLEASE WAIT...'
  processMessages()

  AOBScanModuleOptimizer_AAPrologues_ENABLED = true
  selMR.Active = true
  AOBScanModuleOptimizer_AAPrologues_ENABLED = false

  --activated?
  if not selMR.Active then messageDialog("Make sure it can be ACTIVATED normally.",mtError,mbClose)
    selMR.Async = oldAsyncState
    selMR.Description = oldDescription
    aobscanOptimizerRegistered = registerAutoAssemblerPrologue(aobscanOptimizer)
    return
  end

  selMR.Active = false
  --now deactivated?
  if selMR.Active then messageDialog("Make sure it can be DEACTIVATED normally.",mtError,mbClose)
    selMR.Async = oldAsyncState
    selMR.Description = oldDescription
    aobscanOptimizerRegistered = registerAutoAssemblerPrologue(aobscanOptimizer)
    return
  end

  --replace lines
  local commonPart
  local disablePart

  if enablePos1<disablePos1 then
    commonPart = WHOLESCRIPT:sub(1,enablePos1-1)
    disablePart = WHOLESCRIPT:sub(disablePos1)
  else
    commonPart = WHOLESCRIPT:sub(1,disablePos1-1)
    disablePart = WHOLESCRIPT:sub(disablePos1,enablePos1-1)
  end

  local _,startLine = commonPart:gsub('\r\n','')

  local OPTIMIZED=commonPart..'[ENABLE]\r\n'
  for i=startLine+1,#AOBScanModuleOptimizer_collectedData do
    OPTIMIZED=OPTIMIZED..(AOBScanModuleOptimizer_collectedData[i].fullLine)..'\r\n'
  end
  OPTIMIZED=OPTIMIZED..disablePart
  selMR.Script = OPTIMIZED

  selMR.Async = oldAsyncState
  selMR.Description = oldDescription
  aobscanOptimizerRegistered = registerAutoAssemblerPrologue(aobscanOptimizer)
end



local sl = createStringList()
sl.loadFromFile(getCheatEngineDir()..[[autorun\AOBScanModuleOptimizer.lua]])
local luaExtensionCommonPart = sl.Text:match('%-%-AOBSCANOPTIMIZER COMMON PART START(.*)%-%-AOBSCANOPTIMIZER COMMON PART END')
sl.destroy()
luaExtensionCommonPart:gsub('\r',''):gsub('\n','\r\n')

local function addAOBScanModuleOptimizer_Click_CreateMR()
  local selMR=AddressList.SelectedRecord
  if selMR==nil then return end
  local newMR = AddressList.createMemoryRecord()
  newMR.VarType = vtAutoAssembler
  newMR.Description = '[mgr.inz.Player] AOBScanModuleOptimizer'
  newMR.Script = "[ENABLE]\r\n{$Lua}"..luaExtensionCommonPart..
                 "{$Asm}\r\n\r\n[DISABLE]\r\n{$Lua}\r\n"..
"if aobscanOptimizerRegistered then unregisterAutoAssemblerPrologue(aobscanOptimizerRegistered);aobscanOptimizerRegistered=nil end"..
                 "\r\n{$Asm}\r\n\r\n"
  selMR.appendToEntry(newMR)
end

-- add menuitem
local function addAOBScanModuleOptimizer_PopupMenuEntry()
  local miAOBScanModuleOptimizer = MainForm.miAOBScanModuleOptimizer
  local miAddMemoryRecordWithScript = MainForm.miAddMemoryRecordWithScript

  if miAOBScanModuleOptimizer==nil then
    local miAsyncScript = MainForm.miAsyncScript
    local PopupMenu = MainForm.PopupMenu2

    miAOBScanModuleOptimizer = createMenuItem(MainForm)
    PopupMenu.Items.insert(miAsyncScript.MenuIndex + 1, miAOBScanModuleOptimizer)

    miAddMemoryRecordWithScript = createMenuItem(MainForm)
    PopupMenu.Items.insert(miAsyncScript.MenuIndex + 2, miAddMemoryRecordWithScript)
  end

  miAOBScanModuleOptimizer.Name = 'miAOBScanModuleOptimizer'
  miAOBScanModuleOptimizer.Caption = 'AOBScanModuleOptimizer: (re)optimize'
  miAOBScanModuleOptimizer.OnClick = addAOBScanModuleOptimizer_Click

  miAddMemoryRecordWithScript.Name = 'miAddMemoryRecordWithScript'
  miAddMemoryRecordWithScript.Caption = 'AOBScanModuleOptimizer: create MR with Lua script'
  miAddMemoryRecordWithScript.OnClick = addAOBScanModuleOptimizer_Click_CreateMR
end

addAOBScanModuleOptimizer_PopupMenuEntry()
-- GUI STUFF END