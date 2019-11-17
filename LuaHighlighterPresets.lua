local highlighterPresets = {}

highlighterPresets.MgrInzPlayer = function (SynEdit)
  local BackgroundColor = 0x1FFFFFFF
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0x008000
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[]"

  high.IdentifierAttri.Foreground = 0x1FFFFFFF
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0xFF0000
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x0080FF
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x0080FF
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x808080
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x4A0095
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0xC08000
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0xFF0080
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xA00000
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0xC08000
  high.InternalFunctionAttri.Background = 0xEEEEEE
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.CEDefault = function (SynEdit)
  local BackgroundColor = 0x1FFFFFFF
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0x808080
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0x1FFFFFFF
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0xFF0000
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0xF00000
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x708F00
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x0505E0
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x0000FF
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0xC08000
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0xFF0080
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xA00000
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0xC08000
  high.InternalFunctionAttri.Background = 0xEEEEEE
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.bespin = function (SynEdit)
  local BackgroundColor = 0x1C212A
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0xE09A1E
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0xF8F8F8
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x80F0F6
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x833AFF
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x833AFF
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x39E455
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x39E455
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0xF8F8F8
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0xF8F8F8
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xF8F8F8
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0xF8F8F8
  high.InternalFunctionAttri.Background = 0x2C313A
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.blackBoard = function (SynEdit)
  local BackgroundColor = 0x21100C
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0xAEAEAE
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0xF8F8F8
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x2DDEFB
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x3CFAD8
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x3CFAD8
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x3CCE61
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x3CCE61
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0xF8F8F8
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0xF8F8F8
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xF8F8F8
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0xF8F8F8
  high.InternalFunctionAttri.Background = 0x31201C
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.choco = function (SynEdit)
  local BackgroundColor = 0x0B0F1A
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0x479D67
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0x98BEC3
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x94E6F1
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x5956DA
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x5956DA
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x63A57C
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x63A57C
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0x98BEC3
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0x98BEC3
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0x98BEC3
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0x98BEC3
  high.InternalFunctionAttri.Background = 0x1B1F2A
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.deepBlack = function (SynEdit)
  local BackgroundColor = 0x000000
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0x00FF00
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0xFFFFFF
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x0066FF
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x0080FF
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x0080FF
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x00FF66
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x4A0095
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0xC08000
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0x00FF66
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xA00000
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0xC08000
  high.InternalFunctionAttri.Background = 0x202020
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.helloKitty = function (SynEdit)
  local BackgroundColor = 0xFFB0FF
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0x008000
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0x000000
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0xFF0000
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x0080FF
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x0080FF
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x808080
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x4A0095
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0xC08000
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0xFF0080
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xA00000
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0xC08000
  high.InternalFunctionAttri.Background = 0xDF90DF
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.hotFudgeSundae = function (SynEdit)
  local BackgroundColor = 0x010F2B
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0x088020
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0x5D97B7
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x31D24A
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0xD6A7AF
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0xD6A7AF
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x80BBBC
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x80BBBC
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0x102BD9
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0x28BACF
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xDB7875
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0x102BD9
  high.InternalFunctionAttri.Background = 0x111F3B
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.khaki = function (SynEdit)
  local BackgroundColor = 0xafd7d7
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0x5f8787
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0x005f5f
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x5f0087
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x005f00
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x005f00
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x5f5f00
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x5f5f00
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0x0000af
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0x870000
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0x000087
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0x0000af
  high.InternalFunctionAttri.Background = 0x8fb7b7
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.monoIndustrial = function (SynEdit)
  local BackgroundColor = 0x282C22
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0x686C66
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0xFFFFFF
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x003BC2
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x0088E9
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x0088E9
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0xFFFFFF
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0xFFFFFF
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0xFFFFFF
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0xFFFFFF
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xFFFFFF
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0xFFFFFF
  high.InternalFunctionAttri.Background = 0x383C32
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.monokai = function (SynEdit)
  local BackgroundColor = 0x222827
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0x5E7175
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0xF2F8F8
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0xEFD966
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0xFF81AE
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0xFF81AE
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x74DBE6
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x74DBE6
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0xF2F8F8
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0xF2F8F8
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xF2F8F8
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0xF2F8F8
  high.InternalFunctionAttri.Background = 0x323837
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.mossyLawn = function (SynEdit)
  local BackgroundColor = 0x3D6958
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0x0e392a
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0x76c4f2
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x48e2cb
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x87dcff
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x87dcff
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x87dcff
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x87dcff
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0xAABBFF
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0x3dc5ef
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0x0f1e56
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0xAABBFF
  high.InternalFunctionAttri.Background = 0x4D7968
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.navajo = function (SynEdit)
  local BackgroundColor = 0x809CBA
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0x801818
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0x000000
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x404080
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x5800C0
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x5800C0
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x5800C0
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x5800C0
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0x102BD9
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0x606010
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0x92403b
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0x102BD9
  high.InternalFunctionAttri.Background = 0x708CAA
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.obsidian = function (SynEdit)
  local BackgroundColor = 0x343129
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0x7B7466
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0xE4E2E0
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x63C793
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x22CDFF
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x22CDFF
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x0076EC
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x569FC2
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0xB18C67
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0xB18C67
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xB18C67
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0xB18C67
  high.InternalFunctionAttri.Background = 0x444139
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.plasticCodeWrap = function (SynEdit)
  local BackgroundColor = 0x1D160B
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0xE09A1E
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0xF8F8F8
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x80F0F6
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x833AFF
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x833AFF
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x39E455
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x39E455
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0xF8F8F8
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0xF8F8F8
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xF8F8F8
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0xF8F8F8
  high.InternalFunctionAttri.Background = 0x2D261B
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.rubyBlue = function (SynEdit)
  local BackgroundColor = 0x352411
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0xFFFFFF
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0xFFFFFF
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0xFFFFFF
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0xFFFFFF
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0xFFFFFF
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0xFFFFFF
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0xFFFFFF
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0xFFFFFF
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0xFFFFFF
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xFFFFFF
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0xFFFFFF
  high.InternalFunctionAttri.Background = 0x453421
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.solarized = function (SynEdit)
  local BackgroundColor = 0x362B00
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0x756E58
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0x969483
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x009985
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x98A12A
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x98A12A
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x98A12A
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x98A12A
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0x164BCB
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0x0089B5
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xC4716C
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0x164BCB
  high.InternalFunctionAttri.Background = 0x463B10
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.solarizedLight = function (SynEdit)
  local BackgroundColor = 0xE3F6FD
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0xA1A193
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0x837B65
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x009985
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x98A12A
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x98A12A
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x98A12A
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x98A12A
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0x164BCB
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0x0089B5
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xC4716C
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0x164BCB
  high.InternalFunctionAttri.Background = 0xC3D6DD
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.twilight = function (SynEdit)
  local BackgroundColor = 0x141414
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0x605A5F
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0xF8F8F8
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x98EEF9
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x4C6ACF
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x4C6ACF
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x6A9D8F
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x6A9D8F
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0xF8F8F8
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0xF8F8F8
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xF8F8F8
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0xF8F8F8
  high.InternalFunctionAttri.Background = 0x242424
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.vibrantInk = function (SynEdit)
  local BackgroundColor = 0x000000
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0xCC3399
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0xFFFFFF
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x0066FF
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0x0080FF
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0x0080FF
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x00FF66
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x4A0095
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0xC08000
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0x00FF66
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xFF0000
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0xC08000
  high.InternalFunctionAttri.Background = 0x202020
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.vimDarkBlue = function (SynEdit)
  local BackgroundColor = 0x400000
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0xFFA080
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0xFFFFFF
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0xFF0000
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0xFFFFFF
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0xFFFFFF
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0xA0A0FF
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0xA0A0FF
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0xC08000
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0xFF0080
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xA00000
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0xC08000
  high.InternalFunctionAttri.Background = 0x501010
  high.InternalFunctionAttri.Style = "[fsBold]"
end

highlighterPresets.zenburn = function (SynEdit)
  local BackgroundColor = 0x3F3F3F
  local high = SynEdit.Highlighter
  SynEdit.Color = BackgroundColor

  high.CommentAttri.Foreground = 0x7F9F7F
  high.CommentAttri.Background = BackgroundColor
  high.CommentAttri.Style = "[fsItalic]"

  high.IdentifierAttri.Foreground = 0xCCDCDC
  high.IdentifierAttri.Background = BackgroundColor
  high.IdentifierAttri.Style = "[]"

  high.KeyAttri.Foreground = 0x7DC4DF
  high.KeyAttri.Background = BackgroundColor
  high.KeyAttri.Style = "[fsBold]"

  high.NumberAttri.Foreground = 0xD3D08C
  high.NumberAttri.Background = BackgroundColor
  high.NumberAttri.Style = "[]"

  high.HexAttri.Foreground = 0xD3D08C
  high.HexAttri.Background = BackgroundColor
  high.HexAttri.Style = "[]"

  high.SpaceAttri.Foreground = 0x1FFFFFFF
  high.SpaceAttri.Background = BackgroundColor
  high.SpaceAttri.Style = "[]"

  high.StringAttri.Foreground = 0x9393CC
  high.StringAttri.Background = BackgroundColor
  high.StringAttri.Style = "[]"

  high.LuaMStringAttri.Foreground = 0x9393CC
  high.LuaMStringAttri.Background = BackgroundColor
  high.LuaMStringAttri.Style = "[]"

  high.KeySecondaryAttri.Foreground = 0x99DFCE
  high.KeySecondaryAttri.Background = BackgroundColor
  high.KeySecondaryAttri.Style = "[fsBold]"

  high.KeyTertiaryAttri.Foreground = 0xCCDCDC
  high.KeyTertiaryAttri.Background = BackgroundColor
  high.KeyTertiaryAttri.Style = "[fsBold]"

  high.KeyQuaternaryAttri.Foreground = 0xCCDCDC
  high.KeyQuaternaryAttri.Background = BackgroundColor
  high.KeyQuaternaryAttri.Style = "[fsBold,fsItalic]"

  high.InternalFunctionAttri.Foreground = 0x99DFCE
  high.InternalFunctionAttri.Background = 0x4F4F4F
  high.InternalFunctionAttri.Style = "[fsBold]"
end

local sl = createStringList()
sl.loadFromFile(getCheatEngineDir()..[[autorun\LuaHighlighterPresets_custom.lua]])
local customHighlighterPresetsText = sl.Text
sl.destroy()
if customHighlighterPresetsText~=nil and customHighlighterPresetsText~='' then
  customhighlighterPresets = loadstring(customHighlighterPresetsText)()
  for k,v in pairs(customhighlighterPresets) do
    highlighterPresets[k]=v
  end
end

local script = ''
if cheatEngineIs64Bit() then
script = [==[[ENABLE]
aobscanmodule(LuaHighlighterLoadFromRegistry_AA,cheatengine-x86_64.exe,FF 90 F0 02 00 00 48 8B 93 40)
registersymbol(LuaHighlighterLoadFromRegistry_AA)
LuaHighlighterLoadFromRegistry_AA:
db 90 90 90 90 90 90

aobscanmodule(AAHighlighterLoadFromRegistry_AA,cheatengine-x86_64.exe,FF 90 F0 02 00 00 48 8B 93 30)
registersymbol(AAHighlighterLoadFromRegistry_AA)
AAHighlighterLoadFromRegistry_AA:
db 90 90 90 90 90 90

aobscanmodule(synhighlighterLoadFromRegistry_LuaEngine,cheatengine-x86_64.exe,FF 90 F0 02 00 00 48 8B 93 60)
registersymbol(synhighlighterLoadFromRegistry_LuaEngine)
synhighlighterLoadFromRegistry_LuaEngine:
db 90 90 90 90 90 90

[DISABLE]
LuaHighlighterLoadFromRegistry_AA:
db FF 90 F0 02 00 00

AAHighlighterLoadFromRegistry_AA:
db FF 90 F0 02 00 00

synhighlighterLoadFromRegistry_LuaEngine:
db FF 90 F0 02 00 00

unregistersymbol(LuaHighlighterLoadFromRegistry_AA)
unregistersymbol(AAHighlighterLoadFromRegistry_AA)
unregistersymbol(synhighlighterLoadFromRegistry_LuaEngine)]==]
else
script = [==[[ENABLE]
aobscanmodule(LuaHighlighterLoadFromRegistry_AA,cheatengine-i386.exe,FF 97 78 01 00 00 8B 93)
registersymbol(LuaHighlighterLoadFromRegistry_AA)
LuaHighlighterLoadFromRegistry_AA:
db 90 90 90 90 90 90

aobscanmodule(AAHighlighterLoadFromRegistry_AA,cheatengine-i386.exe,FF 97 78 01 00 00 8B 96 4C)
registersymbol(AAHighlighterLoadFromRegistry_AA)
AAHighlighterLoadFromRegistry_AA:
db 90 90 90 90 90 90

aobscanmodule(synhighlighterLoadFromRegistry_LuaEngine,cheatengine-i386.exe,FF 97 78 01 00 00 8B 96 64)
registersymbol(synhighlighterLoadFromRegistry_LuaEngine)
synhighlighterLoadFromRegistry_LuaEngine:
db 90 90 90 90 90 90

[DISABLE]
LuaHighlighterLoadFromRegistry_AA:
db FF 97 78 01 00 00

AAHighlighterLoadFromRegistry_AA:
db FF 97 78 01 00 00

synhighlighterLoadFromRegistry_LuaEngine:
db FF 97 78 01 00 00

unregistersymbol(LuaHighlighterLoadFromRegistry_AA)
unregistersymbol(AAHighlighterLoadFromRegistry_AA)
unregistersymbol(synhighlighterLoadFromRegistry_LuaEngine)]==]
end

local disableInfo = nil
local overrideLoadFromRegistry_enabled = false

local function switchLoadFromRegistry()
  local success

  if overrideLoadFromRegistry_enabled==false then
    success,disableInfo = autoAssemble(script,true)
  else
    success             = autoAssemble(script,true,disableInfo)
  end

  if success then
    overrideLoadFromRegistry_enabled = not overrideLoadFromRegistry_enabled
  end
end

local function showCurrentHighlighterAttributes()
  local high = getLuaEngine().mScript.Highlighter

  local list = {'CommentAttri','IdentifierAttri','KeyAttri','NumberAttri','HexAttri',
                'SpaceAttri','StringAttri','LuaMStringAttri','KeySecondaryAttri',
                'KeyTertiaryAttri', 'KeyQuaternaryAttri','InternalFunctionAttri'}

  for k,v in pairs(list) do
    print('high.'..v..'.Foreground = 0x'..string.format('%06X',(high[v].Foreground)))
    print('high.'..v..'.Background = 0x'..string.format('%06X',(high[v].Background)))
    print('high.'..v..'.Style = "'..high[v].Style..'"')
    print''
  end
end

local function useNewHighlighterAttributes(func,otherSynEdit)
  func(MainForm.frmAutoInject.Assemblescreen)
  func(getLuaEngine().mScript)
  if otherSynEdit and otherSynEdit.Highlighter.ClassName=='TSynLuaSyn' then func(otherSynEdit) end
end

local function spawnForm(otherSynEdit)

  local immediateMode = isKeyPressed(VK_CONTROL) or isKeyPressed(VK_SHIFT)

  if LuaHighlighterPresetsForm~=nil then
    LuaHighlighterPresetsForm.destroy()
    LuaHighlighterPresetsForm = nil
  end

  LuaHighlighterPresetsForm = createForm(false)
  LuaHighlighterPresetsForm.Caption = 'Lua Highlighter Presets by mgr.inz.Player'
  LuaHighlighterPresetsForm.BorderStyle = 'bsToolWindow'
  local x,y = MainForm.getPosition()
  LuaHighlighterPresetsForm.setPosition(x+10,y+10)
  LuaHighlighterPresetsForm.Constraints.MinWidth = 250

  local label = createLabel(LuaHighlighterPresetsForm)
        label.Caption = 'Choose preset from list below:'..(immediateMode and ' (immediate mode)' or '')
        label.BorderSpacing.Around = 10
  local combobox = createComboBox(LuaHighlighterPresetsForm)
        combobox.Width=label.Width
        combobox.Style='csDropDownList'
        combobox.Anchors = '[akLeft,akTop,akRight]'
        combobox.AnchorSideTop.Side = asrBottom
        combobox.AnchorSideTop.Control = label
        combobox.AnchorSideLeft.Side = asrLeft
        combobox.AnchorSideLeft.Control = LuaHighlighterPresetsForm
        combobox.AnchorSideRight.Side = asrRight
        combobox.AnchorSideRight.Control = LuaHighlighterPresetsForm
        combobox.BorderSpacing.Around = 10


  local highlighterPresetsSorted = {}
  for k,v in pairs(highlighterPresets) do
    highlighterPresetsSorted[1+#highlighterPresetsSorted] = {name=k,func=v}
  end

  table.sort(highlighterPresetsSorted, function (a,b) return a.name < b.name end)

  for i,v in ipairs(highlighterPresetsSorted) do
    combobox.Items.add(v.name)
  end
  combobox.ItemIndex = -1

  if immediateMode then
  combobox.OnChange =
    function ()
      if combobox.ItemIndex<0 then return end
      useNewHighlighterAttributes(highlighterPresetsSorted[combobox.ItemIndex+1].func, otherSynEdit)
    end
  end

  local button = createButton(LuaHighlighterPresetsForm)
        button.Caption = 'Apply && customize preset'
        button.AutoSize = true
        button.AnchorSideTop.Side = asrBottom
        button.AnchorSideTop.Control = combobox
        button.AnchorSideLeft.Side = asrCenter
        button.AnchorSideLeft.Control = LuaHighlighterPresetsForm
        button.BorderSpacing.Around = 20

  button.OnClick =
    function ()
      LuaHighlighterPresetsForm.hide()
      if combobox.ItemIndex<0 then return end
      useNewHighlighterAttributes(highlighterPresetsSorted[combobox.ItemIndex+1].func, otherSynEdit)
      switchLoadFromRegistry()
      MainForm.frmAutoInject.MenuItem2.doClick()
      switchLoadFromRegistry()
    end

  local buttonCancel = createButton(LuaHighlighterPresetsForm)
        buttonCancel.Caption = 'Cancel'
        buttonCancel.AutoSize = true
        buttonCancel.AnchorSideTop.Side = asrBottom
        buttonCancel.AnchorSideTop.Control = button
        buttonCancel.AnchorSideLeft.Side = asrCenter
        buttonCancel.AnchorSideLeft.Control = LuaHighlighterPresetsForm
        buttonCancel.BorderSpacing.Around = 20

  buttonCancel.OnClick =
    function ()
      LuaHighlighterPresetsForm.hide()
    end

  LuaHighlighterPresetsForm.AutoSize = true
  LuaHighlighterPresetsForm.Visible = true
end

-- add menu entries and update SynEdit color to IdentifierAttri background color
local function formCreateNotify(form)
  if not ((form.ClassName=='TfrmLuaEngine') or (form.ClassName=='TfrmAutoInject')) then return end

  local timer=createTimer()
  timer.Interval=10
  timer.OnTimer = function (t)
    if (form.Menu==nil) then return end
    t.destroy()

    local m,mi,SynEdit
    if form.ClassName=='TfrmLuaEngine' then
      m = form.miView
      SynEdit = form.mScript
    elseif form.ClassName=='TfrmAutoInject' then
      m = form.View1
      SynEdit = form.Assemblescreen
    end

    SynEdit.Color = SynEdit.Highlighter.IdentifierAttri.Background

    mi = createMenuItem(m); m.add(mi); mi.Caption = 'Lua Highlighter Presets';m=mi
    mi = createMenuItem(m); m.add(mi); mi.Caption = 'Choose preset'
    mi.OnClick = function (sender)
                   spawnForm(SynEdit)
                 end
    mi = createMenuItem(m); m.add(mi); mi.Caption = 'Current Lua highlighter attributes'
    mi.OnClick = function (sender)
                   showCurrentHighlighterAttributes()
                 end
  end
end

local function initialize()
  if MainForm.frmAutoInject.View1.miLuaHighlighterPresets==nil then
    MainForm.frmAutoInject.Assemblescreen.Color = MainForm.frmAutoInject.Assemblescreen.Highlighter.IdentifierAttri.Background
    local m,mi = MainForm.frmAutoInject.View1,nil
    mi = createMenuItem(m); m.add(mi); mi.Caption = 'Lua Highlighter Presets'; mi.Name = 'miLuaHighlighterPresets';m=mi
    mi = createMenuItem(m); m.add(mi); mi.Caption = 'Choose preset'
    mi.OnClick = function (sender)
                   spawnForm(MainForm.frmAutoInject.Assemblescreen)
                 end
    mi = createMenuItem(m); m.add(mi); mi.Caption = 'Current Lua highlighter attributes'
    mi.OnClick = function (sender)
                   showCurrentHighlighterAttributes()
                 end
  registerFormAddNotification(formCreateNotify)
  end
end

if getCEVersion()>=7.0 then initialize() end
