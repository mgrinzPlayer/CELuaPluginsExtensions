local customHighlighterPresets = {} -- do not change this line

-- an example
customHighlighterPresets.MgrInzPlayer2 = function (SynEdit)
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

  high.HexAttri.Foreground = 0xFF8000
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

return customHighlighterPresets -- do not change this line