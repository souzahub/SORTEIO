program Sorteio;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {MainForm},
  uDados in 'uDados.pas' {dmDados: TDataModule},
  Loading in 'Loading.pas',
  uCadastro in 'uCadastro.pas' {FormCadastro},
  uAvisos in 'uAvisos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TFormCadastro, FormCadastro);
  Application.Run;
end.
