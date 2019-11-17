memoryRecordHotkeysBulkEdit = {}

function memoryRecordHotkeysBulkEdit.formCreateNotify(form)
  if form.ClassName~="THotKeyForm" then return end

  local timer=createTimer()
  timer.Interval=50
  timer.OnTimer = function (t)
                    if (form.BitBtn1==nil) then return end -- wait for OK button
                    t.destroy()
                    memoryRecordHotkeysBulkEdit.addAnotherButton(form)
                  end
end

function memoryRecordHotkeysBulkEdit.addAnotherButton(form)
  local BitBtn1= form.BitBtn1

  local button = createButton(BitBtn1.Parent)
  button.Height = BitBtn1.Height
  button.Width = BitBtn1.Width
  button.AnchorSideLeft.Control = BitBtn1
  button.AnchorSideLeft.Side = asrBottom
  button.AnchorSideTop.Control = BitBtn1
  button.AnchorSideTop.Side = asrCenter
  button.BorderSpacing.Left = 10
  button.Caption = 'Bulk Edit'
  button.Name = 'memoryRecordHotkeysBulkEditButton'

  local AL=getAddressList()
  mainMemrec = AL.SelectedRecord
  otherSelectedMRs = AL.getSelectedRecords()

  button.OnClick =
 function (sender)
  if messageDialog("Are you sure?\nIt will overwrite existing hotkeys for other selected memory records.",mtInformation,mbYes,mbNo) == mrNo then return end
  local TListOffset = memoryRecordHotkeysBulkEdit.TListOffset
  local getTListAddress = memoryRecordHotkeysBulkEdit.readWrite[1]
  local setTListAddress = memoryRecordHotkeysBulkEdit.readWrite[2]
  local addressOfMR = userDataToInteger(mainMemrec)
  local addressOfTList = getTListAddress(addressOfMR + TListOffset) -- Hotkeylist: TList;

  -- alter
  local alteredMR = {}
  for _,otherMR in pairs(otherSelectedMRs) do
    local addressOfOtherMRTListPointer = userDataToInteger(otherMR) + TListOffset
    alteredMR[1+#alteredMR] = {addressOfOtherMRTListPointer,getTListAddress(addressOfOtherMRTListPointer)}
    setTListAddress(addressOfOtherMRTListPointer,addressOfTList)
  end

  local tmp = os.getenv("tmp")

  -- save to TEMP
  saveTable(tmp..'\\bulkEdit.ct')
  -- restore original (so destroy will work without issues)
  for i=1,#alteredMR do setTListAddress(alteredMR[i][1],alteredMR[i][2]) end

  -- load table
  createTimer(nil,true).OnTimer = function (t) t.destroy(); loadTable(tmp..'\\bulkEdit.ct') end

  BitBtn1.doClick() -- close "THotKeyForm"
 end

end

function memoryRecordHotkeysBulkEdit.Init()

  if not (getCEVersion()==6.51) then return end

  if cheatEngineIs64Bit() then
    memoryRecordHotkeysBulkEdit.readWrite = {readQwordLocal, writeQwordLocal}
    memoryRecordHotkeysBulkEdit.TListOffset = 0x48 -- 0x80
  else
    memoryRecordHotkeysBulkEdit.readWrite = {readIntegerLocal, writeIntegerLocal}
    memoryRecordHotkeysBulkEdit.TListOffset = 0x4C
  end
  unregisterFormAddNotification(memoryRecordHotkeysBulkEditNotif)
  memoryRecordHotkeysBulkEditNotif = registerFormAddNotification(memoryRecordHotkeysBulkEdit.formCreateNotify)
end

memoryRecordHotkeysBulkEdit.Init()