skipMoreAdvancedLookup=false
function moreAdvancedLookup(s)
 if skipMoreAdvancedLookup then return nil end
 if s=='' then return end
 local copyofs,result=s

 --skipMoreAdvancedLookup=true

 for out in s:gmatch('%b[]') do
   local address = string.format('%x',(readPointer(out:sub(2,-2)) or 0))
   local out2=out:gsub('[.*+%%[-]','%%%1') -- escape more chars, forgot about it in rev1
   copyofs=copyofs:gsub(out2,address)
   --print(copyofs)
 end

 skipMoreAdvancedLookup=true
 local errorOnLookupFailureOldState=errorOnLookupFailure(false)
 result=getAddress(copyofs)
 errorOnLookupFailure(errorOnLookupFailureOldState)
 skipMoreAdvancedLookup=false
 return result
end

if moreAdvancedLookupID~=nil then unregisterSymbolLookupCallback(moreAdvancedLookupID) end
moreAdvancedLookupID = registerSymbolLookupCallback(moreAdvancedLookup, slNotInt)