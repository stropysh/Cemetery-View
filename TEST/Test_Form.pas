unit Test_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DB_Universal_IB, DB_Test, Operation_DB;

{$R *.dfm}

//Коннект
procedure TForm1.Button1Click(Sender: TObject);
begin
  DB_Universal_IB.connect(DataModule1.Base, 'Data', '.fdb', 'CREM_DB', 'SYSDBA', 'masterkey');
  if dataModule1.Base.Connected = true then
    showmessage('Коннект работает');
end;

//Чтение из БД
procedure TForm1.Button2Click(Sender: TObject);
var
  i: integer;
begin
  Operation_DB.Read(DataModule1.Query, DataModule1.Transact ,'1');
  Memo1.Clear;
  for i:=0 to 14 do
    Memo1.Lines.Add(DataModule1.Query.Fields[i].Value);
end;

end.
