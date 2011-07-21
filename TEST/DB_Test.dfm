object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 168
  Width = 229
  object Base: TIBDatabase
    Left = 16
    Top = 16
  end
  object Query: TIBQuery
    Database = Base
    Transaction = Transact
    Left = 72
    Top = 16
  end
  object Transact: TIBTransaction
    DefaultDatabase = Base
    Left = 136
    Top = 16
  end
end
