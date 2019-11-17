if cheatEngineIs64Bit() then

  local AlwaysStrongReinterpretAddress = autoAssemble([[define(address,cheatengine-x86_64.exe+1D2184)
define(bytes,40 88 D6 48 C7 45 F8 00 00 00 00)
assert(address,bytes)
address:
mov sil,01]],true)

  if AlwaysStrongReinterpretAddress then
   showMessage("always strong reinterpret address enabled")
  else
   showMessage("error: always strong reinterpret address could not be enabled")
  end

end