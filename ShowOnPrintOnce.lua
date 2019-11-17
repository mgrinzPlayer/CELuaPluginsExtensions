local origPrint = print
local cbShowOnPrintChanged = false

function print(...)
  origPrint(...)
  if not cbShowOnPrintChanged then
    getLuaEngine().cbShowOnPrint.Checked = false
    cbShowOnPrintChanged = true
  end
end
