local function addressMistakeCheck(addressString)
  --debug
  --print(addressString)

  local counted_leftBracket,counted_rightBracket = 0,0

  addressString:gsub('%[',function (c) counted_leftBracket=counted_leftBracket+1 end)
  addressString:gsub(']',function (c) counted_rightBracket=counted_rightBracket+1 end)

  if ((counted_leftBracket>0) or (counted_rightBracket>0)) and
     (counted_leftBracket~=counted_rightBracket) then
    local dbgInf3 = debug.getinfo(3)
    local isAALuaCode = (stringToMD5String(dbgInf3.short_src)=='313cfbaaa930b9d4e2ed8108511db63a') or
                        (stringToMD5String(dbgInf3.short_src)=='cc1345622ea008b92ad7f1b6f4de8f49')
    local extraInfo = isAALuaCode and ' (counting starts from {$Lua} line)' or ''
    print('"address" parameter must have the same amount of "[" and "]"')
    print('line number: '..(dbgInf3.currentline + (isAALuaCode and -1 or 0))..extraInfo)
  end

end

registerSymbolLookupCallback( addressMistakeCheck, slNotInt)