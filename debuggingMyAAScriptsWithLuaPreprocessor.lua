function debugAAPrologue(script,syntaxcheck)
  if debugAAA or ((not syntaxcheck) and (debugAA)) then print(script.Text) end
end

registerAutoAssemblerPrologue(debugAAPrologue,true)
