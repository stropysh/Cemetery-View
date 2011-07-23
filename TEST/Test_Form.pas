unit Test_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB_Universal_IB, DB_Test, Operation_DB;

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

{$R *.dfm}

//Коннект
procedure TForm1.Button1Click(Sender: TObject);
begin
  DB_Universal_IB.connect(DataModule1.Base, 'Data', '.fdb', 'CREM_DB', 'SYSDBA', 'masterkey');
  if dataModule1.Base.Connected = true then
    showmessage('Коннект работает');
end;

//Чтение из БД описания захоронения
procedure TForm1.Button2Click(Sender: TObject);
var
  Solution: PSolution_Burial;
begin
  //Запись в структуру
  Operation_DB.Read_Solution(DataModule1.Query, DataModule1.Transact ,'1',2);
  Memo1.Clear;
  Solution:=FMyList.Items[0];
  with Memo1.Lines do
  begin
    Add(inttostr(Solution.number_grave));
    Add(inttostr(Solution.length));
    Add(inttostr(Solution.width));
    Add(inttostr(Solution.birth_year));
    Add(inttostr(Solution.birth_months));
    Add(inttostr(Solution.birth_day));
    Add(inttostr(Solution.death_year));
    Add(inttostr(Solution.death_months));
    Add(inttostr(Solution.death_day));
    Add(Solution.name);
    Add(Solution.sername);
    Add(Solution.thirdname);
    Add(Solution.fence);
  end;
  //Очищаем динамическую память
  Clear_All;
end;

end.
