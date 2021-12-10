unit uCadastro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit,Vcl.Dialogs;

type
  TFormCadastro = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    btn_salvar: TSpeedButton;
    EditNome: TEdit;
    EditBairro: TEdit;
    EditEndereco: TEdit;
    EditTel: TEdit;
    EditNumero: TEdit;
    StyleBook1: TStyleBook;
    SpeedButton1: TSpeedButton;
    procedure btn_salvarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.fmx}

uses Loading, uDados, uAvisos;

procedure TFormCadastro.btn_salvarClick(Sender: TObject);
begin
  if EditNome.Text = '' then
    begin
     AvisoNegativo('Atenção'+ #13 +' Nome Obrigatório !');
     EditNome.SetFocus;
     exit;
    end;

  if EditEndereco.Text = '' then
    begin
     AvisoNegativo('Atenção'+ #13 +' Endereço Obrigatório !');
     EditEndereco.SetFocus;
     exit;
    end;

  if EditNumero.Text = '' then
    begin
     AvisoNegativo('Atenção'+ #13 +' Número Obrigatório !');
     EditNumero.SetFocus;
     exit;
    end;

  if EditBairro.Text = '' then
    begin
     AvisoNegativo('Atenção'+ #13 +' Bairro Obrigatório !');
     EditBairro.SetFocus;
     exit;
    end;

  if EditTel.Text = '' then
    begin
     AvisoNegativo('Atenção'+ #13 +' Telefone Obrigatório !');
     EditTel.SetFocus;
     exit;
    end;

  If MessageDlg('DESEJA SALVAR ?',mtConfirmation,[mbyes,mbno],0) = mryes then
    begin
      dmDados.RDWCliente.Open;
      dmDados.RDWCliente.Append;
      dmDados.RDWClienteNOME .Value := EditNome.Text;
      dmDados.RDWClienteENDERECO.Value := EditEndereco.Text;
      dmDados.RDWClienteNUMERO.Value := EditNumero.Text;
      dmDados.RDWClienteBAIRRO.Value := EditBairro.Text;
      dmDados.RDWClienteTELEFONE.Value := EditTel.Text;
      dmDados.RDWCliente.Post;
      dmDados.RDWCliente.Close;
      dmDados.RDWCliente.Open;

       TLoading.Show(FormCadastro, 'SALVANDO...');

        TThread.CreateAnonymousThread(procedure
        begin
                sleep(1000);
                // Salvando os dados do cliente na base...


                TThread.Synchronize(nil, procedure
                begin
                        TLoading.Hide;
                        FormCadastro.Close;
                end);

        end).Start;


    end;




end;

procedure TFormCadastro.SpeedButton1Click(Sender: TObject);
begin
   Application.Terminate;
end;

end.
