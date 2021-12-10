unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani,
  FMX.Layouts, System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope;

type
  TMainForm = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Layout1: TLayout;
    StringGrid1: TStringGrid;
    Layout2: TLayout;
    RoundRect2: TRoundRect;
    FloatAnimation3: TFloatAnimation;
    FloatAnimation4: TFloatAnimation;
    Text2: TText;
    TextNomeSorteado: TText;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    SaveDialog1: TSaveDialog;
    btn_menu: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure Text2Click(Sender: TObject);
    procedure Sorteia;
    procedure FormCreate(Sender: TObject);
    procedure btn_menuClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vNOME : string;
  end;

var
  MainForm: TMainForm;

implementation

uses
uDados, Loading, uCadastro, uAvisos;

{$R *.fmx}

procedure TMainForm.btn_menuClick(Sender: TObject);
begin
  FormCadastro.ShowModal;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  TextNomeSorteado.Text := '';

end;

procedure TMainForm.Sorteia;
var
float : single;
int : Integer;
i : Integer;
vSorteado :Integer;

vCOD : Integer;

begin
  dmDados.RDWAuxiliar.SQL.Clear;
  dmDados.RDWAuxiliar.SQL.Add('select COUNT( ID ) as TOTAL from CLIENTE ');
  dmDados.RDWAuxiliar.Open;
  vSorteado := dmDados.RDWAuxiliar.FieldByName('TOTAL').AsInteger;
  dmDados.RDWAuxiliar.Close;
//  ShowMessage('Total de '+IntToStr(vSorteado)+' nomes');
  //TextNomeSorteado.Text := IntToStr( vSorteado );
//
  for i := 1 to 1 do // aqui pode estipudar a quantidade de ganhador( caso queira mais de um )
  begin
    int := Random(vSorteado);
//    ShowMessage('int = '+IntToStr(int));
  end;

  dmDados.RDWAuxiliar.SQL.Clear;
  dmDados.RDWAuxiliar.SQL.Add('select ID,NOME from CLIENTE where');
  dmDados.RDWAuxiliar.SQL.Add('(ID LIKE  '+QuotedStr('%'+IntToStr(int)+'%') );
  dmDados.RDWAuxiliar.SQL.Add(')order by NOME ');
  dmDados.RDWAuxiliar.Open;

  vCOD := dmDados.RDWAuxiliar.FieldByName('ID').AsInteger;
  vNOME := dmDados.RDWAuxiliar.FieldByName('NOME').AsString;

  TextNomeSorteado.Text := 'Ganhador(a) '+IntToStr( vCOD )+' - '+vNOME;

  dmDados.RDWCliente.Close;
  dmDados.RDWCliente.Open;

end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TMainForm.Text2Click(Sender: TObject);
begin

  TLoading.Show(MainForm, 'Sorteando...');

  TThread.CreateAnonymousThread(procedure
  begin
  sleep(5000);
  // Salvando os dados do cliente na base...


    TThread.Synchronize(nil, procedure
    begin
      TLoading.Hide;
      Sorteia;
      AvisoPositivo('Parabéns '+ #13 + vNOME + #13 +' vc foi a vencedore!');

      // MainForm.Close;

    end);

  end).Start;


end;

end.
