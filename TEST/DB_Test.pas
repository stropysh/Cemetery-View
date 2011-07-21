unit DB_Test;

interface

uses
  SysUtils, Classes, DB, IBDatabase;

type
  TDataModule1 = class(TDataModule)
    Base: TIBDatabase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
