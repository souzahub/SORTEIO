unit uDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmDados = class(TDataModule)
    conexao: TFDConnection;
    RDWCliente: TFDQuery;
    RDWAuxiliar: TFDQuery;
    RDWClienteID: TIntegerField;
    RDWClienteNOME: TStringField;
    RDWClienteENDERECO: TStringField;
    RDWClienteBAIRRO: TStringField;
    RDWClienteCIDADE: TStringField;
    RDWClienteNUMERO: TStringField;
    RDWClienteTELEFONE: TStringField;
    RDWClienteEMAIL: TStringField;
    RDWClienteCOMPLEMENTO: TStringField;
    RDWClienteUF: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses Main;

{$R *.dfm}

end.
