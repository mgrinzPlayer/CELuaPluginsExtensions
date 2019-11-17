function quickAddAAScriptInit()
  local mf = getMainForm()
  local btnAddAddressManually = mf.btnAddAddressManually

  if btnAddAddressManually.PopupMenu==nil then
     btnAddAddressManually.PopupMenu=createPopupMenu(btnAddAddressManually)
  end

  local mi = createMenuItem(btnAddAddressManually.PopupMenu)
  mi.Caption="Add Address Manually"
  mi.OnClick=btnAddAddressManually.OnClick
  btnAddAddressManually.PopupMenu.Items.add(mi)

  mi = createMenuItem(btnAddAddressManually.PopupMenu)
  mi.Caption="Add Auto Assemble script"
  mi.OnClick=function ()
               local mr = getAddressList().createMemoryRecord()
               mr.Type = vtAutoAssembler
               mr.Script = '[ENABLE]\n\n[DISABLE]\n\n'
               mr.Description = 'Auto Assemble script'
             end
  btnAddAddressManually.PopupMenu.Items.add(mi)

  mi = createMenuItem(btnAddAddressManually.PopupMenu)
  mi.Caption="Add Auto Assemble strict script"
  mi.OnClick=function ()
               local mr = getAddressList().createMemoryRecord()
               mr.Type = vtAutoAssembler
               mr.Script = '{$strict}\n\n[ENABLE]\n\n[DISABLE]\n\n'
               mr.Description = 'Auto Assemble script'
             end
  btnAddAddressManually.PopupMenu.Items.add(mi)
end

quickAddAAScriptInit()