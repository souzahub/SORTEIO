object dmDados: TdmDados
  OldCreateOrder = False
  Height = 283
  Width = 397
  object conexao: TFDConnection
    Params.Strings = (
      'Database=D:\Projetos\2021\VCL\NSorteio\Win32\Release\bd\001.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=utf8'
      'DriverID=FB')
    LoginPrompt = False
    Left = 295
    Top = 16
  end
  object RDWCliente: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from CLIENTE order by ID desc')
    Left = 192
    Top = 16
    object RDWClienteID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object RDWClienteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object RDWClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 80
    end
    object RDWClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 40
    end
    object RDWClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object RDWClienteNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object RDWClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 30
    end
    object RDWClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 150
    end
    object RDWClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 50
    end
    object RDWClienteUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
  end
  object RDWAuxiliar: TFDQuery
    Connection = conexao
    SQL.Strings = (
      '')
    Left = 291
    Top = 96
  end
end
