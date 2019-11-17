local backupInterval = 0.1 -- minutes
local mf = getMainForm()
local sd = mf.SaveDialog1
local sdOrigOnClose = sd.OnClose
local previousBackup = {md5='',filename=''}

local function returnFileName(path)
  return (path~=nil) and (path:match("\\([^\\]+)$")) or ''
end

local function returnFileExtension(path)
  return returnFileName(path):match('(%.[^.]+)$')
end

local function currentTableBackupperFunc(t)
  if sd.Filename=='' then return end

  local extension = returnFileExtension(sd.Filename)
  local backupFilename
  local datetime = (os.date'%c'):gsub('/','-'):gsub(':','.')

  if extension then
    backupFilename = sd.Filename:sub(1,-(#extension+1))..datetime..extension
  else
    backupFilename = sd.Filename..datetime
  end

  saveTable(backupFilename)

  if (previousBackup.md5==md5file(backupFilename)) and
     (previousBackup.filename==sd.Filename) then
    os.remove(backupFilename)
  else
    previousBackup.md5=md5file(backupFilename)
    previousBackup.filename=sd.Filename
  end
end

local currentTableBackupper = createTimer(mf,false)
currentTableBackupper.Interval = backupInterval * 60 * 1000
currentTableBackupper.OnTimer = currentTableBackupperFunc

local function OnClose(sender)
  if sdOrigOnClose then sdOrigOnClose(sender) end
  currentTableBackupper.Enabled = true
end

sd.OnClose = OnClose
