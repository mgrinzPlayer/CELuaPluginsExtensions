collectedTimers = {}
originalCreateTimer = createTimer

function createTimer(...)
  local timer = originalCreateTimer(...)
  collectedTimers[#collectedTimers+1] = timer
  return timer
end

function addDestroyTimersButton()
  local btn=getMainForm().frmAutoInject.Button1
  local newButton = createButton(getMainForm().frmAutoInject.Panel1)
  newButton.Height = 31
  newButton.Width = 129
  newButton.Caption = "Destroy all timers"
  newButton.AnchorSideTop.Control = btn
  newButton.AnchorSideLeft.Control = btn
  newButton.AnchorSideLeft.Side = asrBottom
  newButton.BorderSpacing.Left = 5
  newButton.OnClick = function ()
                       for _,v in ipairs(collectedTimers) do
                        v.destroy()
                       end
                       collectedTimers = {}
                      end

  local luaengineform=getLuaEngine()
  luaengineform.Panel3.Width = 218
  newButton = createButton(luaengineform.Panel3)
  newButton.Width = 129
  newButton.Caption = "Destroy all timers"
  newButton.AnchorSideTop.Control = luaengineform.btnExecute
  newButton.AnchorSideLeft.Control = luaengineform.btnExecute
  newButton.AnchorSideBottom.Control = luaengineform.btnExecute
  newButton.AnchorSideLeft.Side = asrBottom
  newButton.AnchorSideBottom.Side = asrBottom
  newButton.Anchors = '[akTop, akLeft, akBottom]'
  newButton.BorderSpacing.Left = 5
  newButton.OnClick = function ()
                       for _,v in ipairs(collectedTimers) do
                        v.destroy()
                       end
                       collectedTimers = {}
                      end
end

addDestroyTimersButton()