function makeFormTransparent(form,flag,colorkey,alpha)

  flag = flag or 1
  colorkey = colorkey or 0xFFFFFF
  alpha = alpha or 0xFF

  if cheatEngineIs64Bit() then

    handle = readQwordLocal(userDataToInteger(form)+0x538)

    script = [[
    alloc(thread,128)
    createthread(thread)
    thread:
    lea rsp,[rsp-40]
    mov rcx,handle
    mov edx,FFFFFFEC
    call user32.GetWindowLongA
    mov r8d,eax
    or r8d,00080000
    mov rcx,handle
    mov edx,FFFFFFEC
    call user32.SetWindowLongA
    mov rcx,handle
    mov edx,colorkey
    mov r8d,alpha
    mov r9d,00000001
    call user32.SetLayeredWindowAttributes
    lea rsp,[rsp+40]
    ret
    ]]

  else

    handle = bAnd( readQwordLocal(userDataToInteger(form)+0x330) , 0xFFFFFFFF)

    script = [[
    alloc(thread,128)
    createthread(thread)
    thread:

    push -14
    push handle
    call user32.GetWindowLongA
    or eax,80000
    push eax
    push -14
    push handle
    call user32.SetWindowLongA
    push 01
    push alpha
    push colorkey
    push handle
    call user32.SetLayeredWindowAttributes

    ret
    ]]

  end

  script=script:gsub('handle', string.format('%X',handle)):gsub('colorkey', string.format('%X',colorkey))
  script=script:gsub('alpha', string.format('%X',alpha)):gsub('flag', string.format('%X',flag))
  return autoAssemble(script,true)
end