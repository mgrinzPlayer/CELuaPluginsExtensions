SimpleLuaDebugger = {}

function SimpleLuaDebugger.Trace(event, line)
  local s = debug.getinfo(2).short_src
  local name = debug.getinfo(2).name
  name = name and ' ( function '..name..' )' or ''

  if not s:match('%[string') then return end
  SimpleLuaDebugger.DebugLabel.Caption = "Last line executed: "..line..name
end

function SimpleLuaDebugger:Init()
  self.frmLuaTableScript = getMainForm().frmAutoInject
  local btn = getMainForm().frmAutoInject.Button1

  self.debugOnOffFlag = false

  self.DebugLabel = createLabel(self.frmLuaTableScript.Panel1)
  self.DebugLabel.AutoSize = true
  self.DebugLabel.Caption = "Lua debug: disabled"

  self.DebugButton = createButton(self.frmLuaTableScript.Panel1)
  self.DebugButton.AutoSize = true
  self.DebugButton.Width = btn.Width
  self.DebugButton.AutoSize = false
  self.DebugButton.Caption = "Find faulty line"
  self.DebugButton.Height = btn.Height
  self.DebugButton.Anchors = '[akTop,akLeft]'
  self.DebugButton.AnchorSideTop.Control = btn
  self.DebugButton.AnchorSideTop.Side = asrCenter
  self.DebugButton.AnchorSideLeft.Control = btn
  self.DebugButton.AnchorSideLeft.Side = asrRight

  self.DebugButton.OnClick = function ()
      self.debugOnOffFlag = not self.debugOnOffFlag
        if self.debugOnOffFlag then debug.sethook(SimpleLuaDebugger.Trace, "l")
                                    self.DebugLabel.Caption = "Lua debug: enabled"
                               else debug.sethook()
                                    self.DebugLabel.Caption = "Lua debug: disabled"
                               end
    end
end

SimpleLuaDebugger:Init()

--[=[  --Example--

RequiredCEVersion=6.3
if (getCEVersion==nil) or (getCEVersion()<RequiredCEVersion) then
  messageDialog('Please install Cheat Engine '..RequiredCEVersion, mtError, mbOK)
  closeCE()
end
addresslist=getAddressList()


variable1 = 32423
variable2 = 32423

form_show(notExist)

function AboutClick()
  showMessage(gAboutText)
end
gAboutText=[[This trainer was made by Cheat Engine
www.cheatengine.org]]


--]=]--
