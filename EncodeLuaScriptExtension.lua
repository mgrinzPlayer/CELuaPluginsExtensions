function EncodeLuaScriptExtensionButton1Click(sender)

  if EncodeLuaScriptExtension.CEButton1.Caption == 'Cancel' then cancelEncodeLuaScriptExtension=true return end
  EncodeLuaScriptExtension.CEButton1.Caption = 'Cancel'
  cancelEncodeLuaScriptExtension=false

  local cedir = getCheatEngineDir()
  local extensionDir = cedir..[[autorun\EncodeLuaScriptExtension\]]
  local execute1 = '""'..cedir..'cheatengine-i386.exe"   "'..extensionDir..'EncodeLuaScriptExtension.cetrainer""'
  local execute2 = '""'..cedir..'cheatengine-x86_64.exe" "'..extensionDir..'EncodeLuaScriptExtension.cetrainer""'
  local nameFile1 = cedir..[[autorun\EncodeLuaScriptExtension\encoded32.txt]]
  local nameFile2 = cedir..[[autorun\EncodeLuaScriptExtension\encoded64.txt]]

  EncodeLuaScriptExtension.CEMemo1.Lines.saveToFile(extensionDir..'tmp.txt')

  os.remove(extensionDir..'encoded32.txt')
  os.remove(extensionDir..'encoded64.txt')
  createNativeThread(function () os.execute(execute1) end)
  createNativeThread(function () os.execute(execute2) end)

  while cancelEncodeLuaScriptExtension==false do
    local finishedFile1 = io.open(nameFile1,'r')
    local finishedFile2 = io.open(nameFile2,'r')

    local bothFinished = (finishedFile1~=nil) and (finishedFile2~=nil)

    if finishedFile1 then finishedFile1:close() end
    if finishedFile2 then finishedFile2:close() end

    if bothFinished then break end

    processMessages()
    sleep(10)
  end

  EncodeLuaScriptExtension.CEButton1.Caption = 'Convert'

  if cancelEncodeLuaScriptExtension then return end

  local sl = createStringList()

  sl.loadFromFile(nameFile1)
  local scriptFor32bit = sl.Text:gsub('\r',''):gsub('\n','')
  sl.loadFromFile(nameFile2)
  local scriptFor64bit = sl.Text:gsub('\r',''):gsub('\n','')
  sl.destroy()
  sl=nil

  EncodeLuaScriptExtension.CEMemo2.Lines.Text =
"local script32bit = '"..scriptFor32bit.."'\n"..
"local script64bit = '"..scriptFor64bit.."'\n"..[[

if   cheatEngineIs64Bit() then
     decodeFunction(script64bit)()
else decodeFunction(script32bit)()
end]]


end

function EncodeLuaScriptExtensionInit()
  if (EncodeLuaScriptExtension==nil) then
    EncodeLuaScriptExtension=createFormFromFile(getCheatEngineDir()..[[\autorun\EncodeLuaScriptExtension\EncodeLuaScriptExtension.frm]])
  else
    EncodeLuaScriptExtension.show()
  end

EncodeLuaScriptExtension.CEMemo1.Lines.Text = [[
print("This was a triumph!")
print("I'm making a note here:")
print("Huge success!")
]]
end




local mi=createMenuItem(MainForm.MainMenu)
mi.Caption='Encode Lua script'
mi.OnClick=function(mi) EncodeLuaScriptExtensionInit() end
MainForm.miHelp.insert(MainForm.miAbout.MenuIndex,mi)
