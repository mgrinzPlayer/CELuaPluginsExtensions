--------------------------------------------------------------------------------
----------  Cheat Engine Check For Active Scripts ------------------------------
--------------------------------------------------------------------------------

-- store orig onClose so CE properly free some resources
local Ask_Cheats_Off_OrigOnClose = getMainForm().OnClose

local function Ask_Cheats_Off(sender)
  local openedProcess = string.sub(getMainForm().ProcessLabel.Caption,10)
  local list = getAddressList()
  local D = {}  -- Table for display (active AA scripts only)

  -- check if there is opened process
  if readInteger(openedProcess) == nil then Ask_Cheats_Off_OrigOnClose(sender); return caFree end

  for i=0,list.Count-1 do
    if list[i].Active and (list[i].Type == vtAutoAssembler) then
     D[1+#D] = list[i].Description
    end
  end


  if #D > 0 then -- there are active AA scripts
    local A = messageDialog(#D.." scripts are still active:\n\n"..table.concat (D,'\n')..
              "\n\nDo you wish to deactivate them before close?", mtConfirmation, mbYes, mbNo, mbCancel)

    if A == mrYes then
      for i=list.Count-1,0,-1 do
        list[i].Active = false -- deactivate (and also unfreeze, but, we do not care)
      end
      Ask_Cheats_Off_OrigOnClose(sender); return caFree
    elseif A == mrNo then
      Ask_Cheats_Off_OrigOnClose(sender); return caFree
    end

  else -- no active AA script(s)
    Ask_Cheats_Off_OrigOnClose(sender); return caFree
  end
end

getMainForm().OnClose = Ask_Cheats_Off
