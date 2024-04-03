object Form1: TForm1
  Left = 0
  Top = 0
  ClientHeight = 278
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  DesignSize = (
    614
    278)
  TextHeight = 13
  object Edit1: TEdit
    Left = 40
    Top = 32
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 199
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 40
    Top = 61
    Width = 536
    Height = 188
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
  end
  object Button2: TButton
    Left = 280
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 3
    OnClick = Button2Click
  end
end
