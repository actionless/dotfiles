-- Lua code formatter
-- Removes tabs and checks lines arent too long.
-- Nick Trout
-- $Header: /Tools/build/codefmt.lua 3     16/08/01 20:00 Nick $
-- For Lua 5.0

mytabs = 4 -- spaces (default)
myindent = 4 -- spaces (default)
codetabsize = 8 -- spaces
codeindent = 2 -- spaces per indent
codelinelength = 80 -- characters


usage = 
[[

Usage: lua -f codeformat.lua ...options...

Options are:
--file <lua file>
--ts <spaces>, tabsize: number of spaces in your tabs
--in <spaces>, indent size: number of spaces for each indentation

]]


function process_args()
 -- get args set by user in command line
 local t,i = {},1
 while i<table.getn(arg) do
  local a=arg[i]
  if a=="--file" then
   t.filename,i = arg[i+1],i+2
  elseif a=="--ts" then
   t.mytabsize,i = arg[i+1]+0,i+2
  elseif a=="--in" then
   t.myindent,i = arg[i+1]+0,i+2
  else
   print(usage.."Bad flag: "..a)
   os.exit(-1)
  end
 end
 return t
end

function readfile(f)
 local fh=io.open(f,"rt")
 local t={}
 while 1 do
  local ln=fh:read("*l")
  if ln then table.insert(t,ln) else break end
 end
 fh:close()
 return t
end

-- convert any leading tabs in a given string to spaces.
-- the number of spaces to replace the tab by is given by args.mytabsize
function convertTabsToSpaces(ln)
 local s,e = string.find(ln,"\t+",1)
 if s and s==1 then
  local spc = string.rep(" ",args.mytabsize*(e-s+1))
  ln = spc..string.sub(ln,e+1)
 end
 return ln
end

-- convert any indentation to use the standard indent
function indent(ln)
 local s,e = string.find(ln," +",1)
 if s==1 then
  local indent = (e-s+1)/args.myindent
  ln = string.rep(" ",codeindent*indent)..string.sub(ln,e+1)
 end
 return ln
end
 
function process(lines)
 for li=1,table.getn(lines) do
  local line=lines[li]
  line = convertTabsToSpaces(line)
  line = indent(line)
  -- warn if length too long
  local len=string.len(line)
  if len>codelinelength then
   print("-- ######## Line too long ("..len.." chars) ######## :")
  end
  print(line)
 end
end

args = process_args()
if not args.filename then error(usage.."no Lua file given") end
args.mytabsize = args.mytabsize or mytabs
args.myindent = args.myindent or myindent
process( readfile(args.filename) )
