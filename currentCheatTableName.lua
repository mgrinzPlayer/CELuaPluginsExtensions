local mf = getMainForm()
local sd = mf.SaveDialog1
local od = mf.OpenDialog1

local function returnFileName(path)
 --extracts file name from full path (not full path => return nil)
 return (path~=nil) and (path:match("\\([^\\]+)$"))
end

local currentTableNameLabel = createLabel(mf.Panel5)
currentTableNameLabel.AnchorSideLeft.Control = mf.foundcountlabel
currentTableNameLabel.AnchorSideLeft.Side = asrBottom
currentTableNameLabel.AnchorSideTop.Control = mf.foundcountlabel
currentTableNameLabel.AnchorSideTop.Side = asrCenter
currentTableNameLabel.BorderSpacing.Left = 20

local currentTableNameTimer = createTimer(mf)
currentTableNameTimer.Interval = 500
currentTableNameTimer.OnTimer = function (t)
  local name = returnFileName(sd.Filename) or returnFileName(od.Filename)
  if name then currentTableNameLabel.Caption = 'Current table name:  '..name
          else currentTableNameLabel.Caption = '' end
end
