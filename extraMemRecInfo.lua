local mf = getMainForm()
local al = getAddressList()

local function tohexwithsign(a)
  if type(a)=='number' then
    return (a>=0 and string.format('+%X',a) or string.format('-%X',-a))
  else
    return a:sub(1,1)=='-' and a or ('+'..a)
  end
end

--panel
local panelFromExtraMemRecInfo = createPanel(mf)
panelFromExtraMemRecInfo.BevelOuter = 'bvNone'
panelFromExtraMemRecInfo.Name = 'pnlExtraMemRecInfo'
panelFromExtraMemRecInfo.Caption = ''
panelFromExtraMemRecInfo.Align = alBottom
panelFromExtraMemRecInfo.Height = 1

--splitter
local splitterFromExtraMemRecInfo = createSplitter(mf)
splitterFromExtraMemRecInfo.Name = 'splExtraMemRecInfo'
splitterFromExtraMemRecInfo.Align = alBottom
splitterFromExtraMemRecInfo.Height = 5

--label
local labelFromExtraMemRecInfo = createLabel(panelFromExtraMemRecInfo)
labelFromExtraMemRecInfo.Align = alClient
labelFromExtraMemRecInfo.BorderSpacing.Around = 5

--set proper minimal size
splitterFromExtraMemRecInfo.MinSize = labelFromExtraMemRecInfo.Canvas.getTextHeight('DdGgJjQqWwXxYy')+10

--pop-up menu
labelFromExtraMemRecInfo.PopupMenu=createPopupMenu(labelFromExtraMemRecInfo)
local pm=labelFromExtraMemRecInfo.PopupMenu
local pmi=pm.Items
local mi1=createMenuItem(pm); pmi.add(mi1); mi1.Caption = 'Copy ID'
local mi2=createMenuItem(pm); pmi.add(mi2); mi2.Caption = 'Copy pointer string'

mi1.OnClick = function () writeToClipboard(al.SelectedRecord.ID) end
mi2.OnClick = function ()
                local mr=al.SelectedRecord
                local pointerStr = mr.Address
                  for i=mr.OffsetCount-1,0,-1 do
                    pointerStr = '['..pointerStr..']'..tohexwithsign(mr.Offset[i])
                  end
                writeToClipboard(pointerStr)
              end

pm.OnPopup = function ()
               if al.SelectedRecord==nil then
                 mi1.Enabled=false
                 mi2.Enabled=false
               else
                 mi1.Enabled=true
                 mi2.Enabled=(al.SelectedRecord.Address~='')
               end
             end


--pop-up menu (fix ExtraMemRecInfo position)
splitterFromExtraMemRecInfo.PopupMenu=createPopupMenu(splitterFromExtraMemRecInfo)
local pm=splitterFromExtraMemRecInfo.PopupMenu
local pmi=pm.Items
local mi1=createMenuItem(pm); pmi.add(mi1); mi1.Caption = 'fix ExtraMemRecInfo position'
mi1.OnClick = function () panelFromExtraMemRecInfo.Top = 0; splitterFromExtraMemRecInfo.Top = 0 end


-- timer
local function timerFuncFromExtraMemRecInfo(t)
  if panelFromExtraMemRecInfo.Height < 5 then return end

  local mr,str = al.SelectedRecord,''
  if mr~=nil then
    str=string.format('index: %d    id: %d    children: %d', mr.Index, mr.ID, mr.Count)

    if mr.HotkeyCount>0 then
      str=string.format('%s    hotkeys: %d', str, mr.HotkeyCount)
    end

    local pointerStr = mr.Address
    if pointerStr~='' and not (mr.Type==vtAutoAssembler) then
      for i=mr.OffsetCount-1,0,-1 do
        pointerStr=string.format('[%s]%s', pointerStr, tohexwithsign(mr.Offset[i]))
      end
      str=str..'    address: '..pointerStr
    end

    if mr.Type==vtAutoAssembler then
      if mr.Async then str=str..'\r\nasynchronous: true'
                  else str=str..'\r\nasynchronous: false' end
    end

    if mr.DropDownCount>0 then
      str=str..'\r\nhas dropdown list'
      if mr.DropDownLinked then str=string.format('%s (linked to: "%s")', str, mr.DropDownLinkedMemrec) end
    end

  end
  labelFromExtraMemRecInfo.Caption=str
end

timerFromExtraMemRecInfo = createTimer(panelFromExtraMemRecInfo)
timerFromExtraMemRecInfo.OnTimer = timerFuncFromExtraMemRecInfo
timerFromExtraMemRecInfo.Interval = 100

createTimer(nil).OnTimer = function (t) if mf.Visible then t.destroy() splitterFromExtraMemRecInfo.Top = 0 end end
