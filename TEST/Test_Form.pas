unit Test_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DB_Universal_IB, DB_Test;

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
begin
  DB_Universal_IB.connect(DataModule1.Base, 'Data', '.fdb', 'CREM_DB', 'SYSDBA', 'masterkey');
  if dataModule1.Base.Connected = true then
    showmessage('Коннект работает');
end;

end.
