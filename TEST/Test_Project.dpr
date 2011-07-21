program Test_Project;

uses
  Forms,
  Test_Form in 'Test_Form.pas' {Form1},
  DB_Test in 'DB_Test.pas' {DataModule1: TDataModule},
  DB_Universal_IB in '..\UDB Universal\DB_Universal_IB.pas',
  Operation_DB in '..\UOperation DB\Operation_DB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
