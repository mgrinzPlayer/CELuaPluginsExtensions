string.count = function(str, s2)
  local count = 0
  for i = 1, #str do
    if str:sub(i,i) == s2 then
      count = count + 1
    end
  end
  return count
end

string.trim = function(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

indent_str = '  '

level = 0

braces = {
  {'{','}'},
  {'(',')'},
}

opens_function = function(line)
  local funcs = 0
  for exp in line:gfind('(.?)function') do
    if #exp == 0 or exp:match('[,{}%)%(%s=]') then
      funcs = funcs + 1
    end
  end
  local ends = 0
  for exp in line:gfind('function%s*(.*)%s*end') do
    if #exp == 0 or exp:match('[,{}%(%)%s]') then
      ends = ends + 1
    end
  end
  local dif = funcs - ends
  if dif > 0 then
    return dif
  else
    return 0
  end
end

posts = {
  ['.*then$'] = 1,
  ['^repeat%s*$'] = 1,
  ['.*do%s*$'] = 1,
  ['^else%s*$'] = 1,
  ['^end.*%)'] = -1,
}

pres = {
  ['^end,?$'] = -1,
  ['^until.*'] = -1,
  ['else$'] = -1,
  ['elseif.*'] = -1,
}

-- removes strings ('bla' -> '') and trailing comments
isolate = function(l)
  local pure = l:gsub('"[^"]*"','""')
  pure = pure:gsub("'[^']*'","''")
  return pure:match('(.*)%-%-.*') or pure
end

debugp = function() end
if os.getenv('LUDENTDEBUG') == '1' then
  debugp = print
end

indent = function(src,dst)
  for line in src:lines() do
    line = line:trim() or ''
    local pure = isolate(line)

    local pre = 0
    local post = 0

    debugp('------',pure)

    for _,b in pairs(braces) do
      local dif = pure:count(b[1]) - pure:count(b[2])
      if dif ~= 0 then
        debugp('-- BRACE',dif,level)
      end
      if dif > 0 then
        post = post + dif
      elseif dif < 0 then
        pre = pre + dif
      end
    end

    for exp,inc in pairs(pres) do
      if pure:match(exp) then
        debugp('-- PRE',inc,level,exp,pure)
        pre = pre + inc
      end
    end

    local openf = opens_function(pure)
    if openf ~= 0 then
      debugp('-- FUNCTION',openf,level)
    end
    post = post + openf

    for exp,inc in pairs(posts) do
      if pure:match(exp) then
        debugp('-- POST',inc,level,exp,pure)
        post = post + inc
      end
    end

    --    debugp('------')

    -- print('L',level,post,pre,dif)

    level = level + pre

    dst:write(string.rep(indent_str,level)..line..'\n')

    level = level + post
  end
end

luatidy=function(infile)
 src = io.open(infile)
 dst = io.open(infile..'tidy.lua','w')
 indent(src,dst)
 src:close()
 dst:close()
end

