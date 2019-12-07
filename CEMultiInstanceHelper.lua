--version 1.05
local colorTable = {-1,0x008000,0xff8000,0x95004a,0x0000ff,0x0080c0,0x8000ff,0x0000a0}
local usedColors = {}

for pid,wndCaption in pairs(getWindowlist()) do
  for i=1,#wndCaption do
    if wndCaption[i]:match('Cheat Engine %d+%.[%.%d]+.*#%d+') then
      local colorID = tonumber(wndCaption[i]:match('#(%d+)')) or 'ignore'
      usedColors[colorID]=true
      break
    end
  end
end

if (usedColors[1]==true) then
  local color
  local colorID=2
  for i=2,#colorTable do --find unused color
    if not usedColors[i] then color = colorTable[i]; colorID=i; break; end
  end
  local function allowedTForms(formClassName)
    local someTForms = {
                        ['TAbout']=1,
                        ['TFindDialogForm']=1,
                        ['TFindWindow']=1,
                        ['TFormDesigner']=1,
                        ['TFormMemoryRegions']=1,
                        ['TFrmMemoryRecordDropdownSettings']=1,
                        ['THotKeyForm']=1,
                        ['TInputboxTop']=1,
                        ['TMemoryBrowser']=1,
                        ['TObjectInspectorDlg']=1,
                        ['TProcessWindow']=1,
                        ['TReplaceDialogForm']=1,
                        ['TformAddressChange']=1,
                        ['TfrmAAEditPrefs']=1,
                        ['TfrmAccessedMemory']=1,
                        ['TfrmAssemblyScan']=1,
                        ['TfrmAutoInject']=1,
                        ['TfrmBreakpointlist']=1,
                        ['TfrmCodeFilter']=1,
                        ['TfrmCodecaveScanner']=1,
                        ['TfrmDissectCode']=1,
                        ['TfrmEnumerateDLLs']=1,
                        ['TfrmFillMemory']=1,
                        ['TfrmFindStatics']=1,
                        ['TfrmLuaEngine']=1,
                        ['TfrmMemoryAllocHandler']=1,
                        ['TfrmMemoryViewEx']=1,
                        ['TfrmMemviewPreferences']=1,
                        ['TfrmPEInfo']=1,
                        ['TfrmPointerScannerSettings']=1,
                        ['TfrmReferencedFunctions']=1,
                        ['TfrmReferencedStrings']=1,
                        ['TfrmRescanPointer']=1,
                        ['TfrmSetupPSNNode']=1,
                        ['TfrmStacktrace']=1,
                        ['TfrmStringMap']=1,
                        ['TfrmStringPointerScan']=1,
                        ['TfrmStructureCompare']=1,
                        ['TfrmStructures2']=1,
                        ['TfrmStructuresConfig']=1,
                        ['TfrmThreadlist']=1,
                        ['TfrmTrainerGenerator']=1,
                        ['TfrmUltimap']=1,
                        ['TfrmUltimap2']=1,
                        ['TfrmWatchlist']=1,
                        ['TfrmdissectWindow']=1,
                        ['Tfrmpointerscanner']=1,
                       }


    return someTForms[formClassName]~=nil
  end

  local function addNicePanels(form)
    local canvas
    local Panel1 = createPanel(form)
          Panel1.Visible = false
          --Panel1.Top = form.Height - 2
          --Panel1.Left = 0
          --Panel1.Height = 2
          --Panel1.Width = form.Width
          Panel1.Align = alBottom
          Panel1.Constraints.MinHeight = 2
          Panel1.Constraints.MaxHeight = 2
          Panel1.Anchors = '[akBottom, akLeft, akRight]'
          Panel1.bringToFront()
          Panel1.Caption = ''
          Panel1.Color = color
          Panel1.BevelOuter = 0

    local Panel2 = createPanel(form)
          Panel2.Visible = false
          Panel2.Top = 0
          Panel2.Left = 0
          Panel2.Height = 2
          Panel2.Width = form.Width
          Panel2.Anchors = '[akTop, akLeft, akRight]'
          Panel2.bringToFront()
          Panel2.Caption = ''
          Panel2.Color = color
          Panel2.BevelOuter = 0

    local Panel3 = createPanel(form)
          Panel3.Visible = false
          Panel3.Top = 0
          Panel3.Left = 0
          --Panel3.Height = form.Height
          Panel3.AnchorSideBottom.Control = Panel1
          Panel3.Width = 2
          Panel3.Anchors = '[akTop, akLeft, akBottom]'
          Panel3.bringToFront()
          Panel3.Caption = ''
          Panel3.Color = color
          Panel3.BevelOuter = 0

    local Panel4 = createPanel(form)
          Panel4.Visible = false
          Panel4.Top = 0
          Panel4.Left = form.Width - 2
          --Panel4.Height = form.Height
          Panel4.AnchorSideBottom.Control = Panel1
          Panel4.Width = 2
          Panel4.Anchors = '[akTop, akRight, akBottom]'
          Panel4.bringToFront()
          Panel4.Caption = ''
          Panel4.Color = color
          Panel4.BevelOuter = 0

    Panel1.Visible = true
    Panel2.Visible = true
    Panel3.Visible = true
    Panel4.Visible = true
  end

  --MainForm.Splitter1.Color = color
  addNicePanels(MainForm)
  addNicePanels(MainForm.frmAutoInject)
  addNicePanels(getMemoryViewForm())
  addNicePanels(getSettingsForm())
  addNicePanels(getLuaEngine())

  for i=0,getFormCount()-1 do
    local formClassName = getForm(i).ClassName
    if formClassName=='TAdvancedOptions' or formClassName=='TComments' or formClassName=='TTypeForm' then
      addNicePanels(getForm(i))
    end
  end

  local ap=getApplication()
  ap.Title = ap.Title..' #'..colorID

  registerFormAddNotification(function (form)
    if not allowedTForms(form.className) then return end
    local t=createTimer()
    t.Interval = 1
    t.OnTimer = function (timer)
      timer.destroy()
      --print(form.className)
      addNicePanels(form)
    end
  end)
else
  local ap=getApplication()
  ap.Title = ap.Title..' #1'
end
