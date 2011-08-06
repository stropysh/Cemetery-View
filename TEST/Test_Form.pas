unit Test_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ScrollBox1: TScrollBox;
    PaintBox1: TPaintBox;
    Edit1: TEdit;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ScrollBox1CanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure PaintBox1Paint(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FMovement: boolean; //Перемещение объекта при зажатой клавишей

  procedure test1;

implementation

uses
  DB_Universal_IB, DB_Test, Operation_DB, Figure;

{$R *.dfm}

//Тест1
procedure test1;
begin
  showmessage('Пашет!');
end;
//Скроллбокс
procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
  Burial.Paint_All_Burial;
  Burial.Paint_Select_Burial;
end;
procedure TForm1.ScrollBox1CanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Paintbox1.Repaint;
end;
//------------------------------------------------------------------------------
//Создание классов
procedure TForm1.FormCreate(Sender: TObject);
begin
  Figures:=TFigure.Create(PaintBox1.Canvas);
  Burial:=TBurial.Create(PaintBox1.Canvas);
  PaintBox1.Width:=Figure.VISUAL_X;
  PaintBox1.Height:=Figure.VISUAL_Y;
end;

//Коннект
procedure TForm1.Button1Click(Sender: TObject);
begin
  DB_Universal_IB.connect(DataModule1.Base, 'Data', '.fdb', 'CREM_DB', 'SYSDBA', 'masterkey');
  if dataModule1.Base.Connected = true then
    showmessage('Коннект работает');
end;

//Чтение из БД описания захоронения
procedure TForm1.Button2Click(Sender: TObject);
begin
  //Запись в структуру
  Read_Solution(DataModule1.Query, DataModule1.Transact ,'2',2);
  Memo1.Clear;
  with Memo1.Lines do
  begin
    Add(inttostr(FSolution_Burial.number_grave));
    Add(inttostr(FSolution_Burial.length));
    Add(inttostr(FSolution_Burial.width));
    Add(inttostr(FSolution_Burial.birth_year));
    Add(inttostr(FSolution_Burial.birth_months));
    Add(inttostr(FSolution_Burial.birth_day));
    Add(inttostr(FSolution_Burial.death_year));
    Add(inttostr(FSolution_Burial.death_months));
    Add(inttostr(FSolution_Burial.death_day));
    Add(FSolution_Burial.name);
    Add(FSolution_Burial.sername);
    Add(FSolution_Burial.thirdname);
    Add(FSolution_Burial.fence);
  end;
end;

//Чтение из БД координат
procedure TForm1.Button3Click(Sender: TObject);
var
  Coordinates: PCoordinates;
  i: integer;
begin
  //Запись в структуру
  Read_Coordinates(DataModule1.Query, DataModule1.Transact ,'34');
  Memo1.Clear;
  New(Coordinates);
  for i:=0 to High(FCoordinates) do
  begin
    Coordinates^:=FCoordinates[i];
    with Memo1.Lines do
    begin
      Add(inttostr(Coordinates.id_burial));
      Add(inttostr(Coordinates.latitude));
      Add(inttostr(Coordinates.longitude));
    end;
  end;
  Dispose(Coordinates);
end;

//Нарисовать все захоронения
procedure TForm1.Button4Click(Sender: TObject);
begin
  with Burial do
  begin
    FColor_border:=clGreen;
    Fpen_width:= 4;
    //Заливка
    FColor_Background:=clRed;
    FScale:=StrToInt(Edit1.Text);
    Paint_All_Burial;
  end;
end;

//Выделить объект
procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMovement:=true;
  Burial.Select_Burial(X,Y);
end;

//Перемещение объекта
procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if FMovement = true then  //Проверяем зажата ли клавиша
    burial.Paint_Move(X,Y);
  StatusBar1.Panels.Items[0].Text:='X: '+IntToStr(X);
  StatusBar1.Panels.Items[1].Text:='Y: '+IntToStr(Y);
end;

//Оканчание перемещения
procedure TForm1.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMovement:=false;
  if burial.FMove = true then
  begin
    if MessageDlg('Сохранить координаты?', mtConfirmation, [mbYes, mbNo],0)=mrYes then
      Burial.Paint_Finish(X,Y, true)
    else
      Burial.Paint_Finish(X,Y, false);
  end;
end;

end.
