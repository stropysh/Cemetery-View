object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1058#1045#1057#1058
  ClientHeight = 487
  ClientWidth = 960
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 698
    Top = 8
    Width = 243
    Height = 13
    Caption = #1042#1099#1074#1086#1076' '#1090#1077#1089#1082#1090#1086#1074#1086#1081' '#1080' '#1095#1080#1089#1083#1086#1074#1086#1081' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 506
    Top = 8
    Width = 97
    Height = 13
    Caption = #1056#1080#1089#1091#1077#1090' '#1086#1073#1098#1077#1082#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 121
    Height = 25
    Caption = #1050#1086#1085#1085#1077#1082#1090
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 52
    Width = 201
    Height = 25
    Caption = #1063#1090#1077#1085#1080#1077' '#1080#1079' '#1041#1044' '#1086#1087#1080#1089#1072#1085#1080#1103' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1103
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 96
    Width = 201
    Height = 25
    Caption = #1063#1090#1077#1085#1080#1077' '#1080#1079' '#1041#1044' '#1082#1086#1086#1088#1076#1080#1085#1072#1090
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 232
    Top = 8
    Width = 185
    Height = 25
    Caption = #1053#1072#1088#1080#1089#1086#1074#1072#1090#1100' '#1074#1089#1077' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1103
    TabOrder = 3
    OnClick = Button4Click
  end
  object ScrollBox1: TScrollBox
    Left = 450
    Top = 45
    Width = 250
    Height = 279
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 4
    OnCanResize = ScrollBox1CanResize
    object PaintBox1: TPaintBox
      Left = 0
      Top = 0
      Width = 500
      Height = 500
      OnMouseDown = PaintBox1MouseDown
      OnMouseMove = PaintBox1MouseMove
      OnMouseUp = PaintBox1MouseUp
      OnPaint = PaintBox1Paint
    end
  end
  object Edit1: TEdit
    Left = 452
    Top = 344
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 5
    Text = '100'
  end
  object Memo1: TMemo
    Left = 736
    Top = 45
    Width = 187
    Height = 275
    BevelKind = bkSoft
    ScrollBars = ssVertical
    TabOrder = 6
  end
end
