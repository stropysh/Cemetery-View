unit DB_Universal_IB;

interface

uses DB, IBDatabase, SysUtils, Dialogs, Forms, Controls;

procedure connect(DB: TIBDataBase; directory, extension, file_name, user, pass: string);

implementation

{ Connect }

// Подключение
procedure connect(DB: TIBDataBase; directory, extension, file_name, user, pass: string);
begin
  try
    with DB do
    begin
      Connected := false;
      DatabaseName := ExtractFilePath(ParamStr(0)) + directory +'\'+ file_name + extension;
      LoginPrompt := false;
      Params.Clear;
      Params.Add('user_name=' + user);
      Params.Add('password=' + pass);
      Params.Add('lc_ctype=win1251');
      Connected := true;
    end;
  except
    if MessageDlg('Файл '+file_name + extension+' не найден или повреждён. Дальнейшая работа программы невозможна!',
                  mtWarning, [mbOk],0)=mrOk then
    Application.Terminate;
  end;
end;

end.
