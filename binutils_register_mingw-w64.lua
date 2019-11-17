local mingw32={}
mingw32.Name="MinGW-W64"
mingw32.Description="32bit"
mingw32.Architecture="i386:intel"
mingw32.OBJDUMPParam='-Mi386,intel,intel-mnemonic'
mingw32.ASParam='"--32" "-n" "-msyntax=intel" "-mmnemonic=intel" "-mnaked-reg"'
mingw32.LDParam=''
mingw32.Path=[[C:\mingw-w64\mingw32\bin]]
mingw32.Prefix=""
mingw32.DisassemblerCommentChar="#"
registerBinUtil(mingw32)


local mingw64={}
mingw64.Name="MinGW-W64"
mingw64.Description="64bit"
mingw64.Architecture="i386:x86-64:intel"
mingw64.OBJDUMPParam='-Mx86-64,intel,intel-mnemonic'
mingw64.ASParam='"--64" "-n" "-msyntax=intel" "-mmnemonic=intel" "-mnaked-reg"'
mingw64.LDParam=''
mingw64.Path=[[C:\mingw-w64\mingw64\bin]]
mingw64.Prefix=""
mingw64.DisassemblerCommentChar="#"
registerBinUtil(mingw64)