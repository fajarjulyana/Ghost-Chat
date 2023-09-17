object ChatForm: TChatForm
  Left = 192
  Top = 124
  Width = 450
  Height = 369
  Caption = 'Ghost Chat'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainChat: TGroupBox
    Left = 24
    Top = 16
    Width = 385
    Height = 297
    TabOrder = 1
    object BoxChat: TEdit
      Left = 40
      Top = 248
      Width = 241
      Height = 25
      TabOrder = 0
    end
    object ListChat: TListBox
      Left = 40
      Top = 40
      Width = 241
      Height = 177
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object Kirim: TButton
    Left = 312
    Top = 264
    Width = 75
    Height = 25
    Caption = 'SEND'
    TabOrder = 0
  end
end
