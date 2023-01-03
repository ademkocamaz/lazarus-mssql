unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, DB, Forms, Controls, Dialogs, StdCtrls, Unit2, Unit3,
  VirtualDBGrid, ZConnection, ZDataset, Classes, IniFiles;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    DataSource1: TDataSource;
    ListBox1: TListBox;
    Memo1: TMemo;
    VirtualDBGrid1: TVirtualDBGrid;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Run;
  private
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Run;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  settingsIni: string;
  settings: TIniFile;
begin
  settingsIni := IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) +
    'settings.ini';
  //ShowMessage(settingsIni);

  if not FileExists(settingsIni) then
  begin
    Form2.ShowModal;
    if not FileExists(settingsIni) then
      Application.Terminate;
  end;
  settings := TIniFile.Create(settingsIni);
  ZConnection1.HostName := settings.ReadString('Connection', 'Host', '');
  ZConnection1.User := settings.ReadString('Connection', 'User', '');
  ZConnection1.Password := settings.ReadString('Connection', 'Password', '');
  ZConnection1.Database := settings.ReadString('Database', 'Name', '');
  FreeAndNil(settings);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Lines.Clear;
  ZQuery1.SQL.Clear;
  ListBox1.Items.Clear;
end;

procedure TForm1.Run;
begin
  if Memo1.Lines.Text = string.Empty then
  begin
    raise Exception.Create('Empty SQL');
  end;
  try
    Screen.Cursor:=crHourGlass;
    try
      ZConnection1.Connect;
      Log(Memo1.Lines.Text);
      ZQuery1.SQL := Memo1.Lines;
      if not ZQuery1.Prepared then
        ZQuery1.Prepare;
      ZQuery1.Open;
    except
      on Exc: Exception do
      begin
        Screen.Cursor:=crDefault;
        ShowMessage(Exc.Message);
        Log(Exc.Message);
      end;

    end;
  finally
    ZQuery1.Unprepare;
    Screen.Cursor:=crDefault;
  end;
end;

end.
