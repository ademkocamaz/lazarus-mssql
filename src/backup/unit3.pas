unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, IniFiles, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, StdCtrls, UExceptionLogger, ZConnection, ZDataset;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

const
  iniFile = 'settings.ini';

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ZConnection1.HostName := LabeledEdit1.Text;
    ZConnection1.User := LabeledEdit2.Text;
    ZConnection1.Password := LabeledEdit3.Text;
    ZConnection1.Connect;
    ZQuery1.SQL.Text := 'SELECT NAME FROM SYS.DATABASES';
    if not ZQuery1.Prepared then
      ZQuery1.Prepare;
    ZQuery1.Open;
    while not ZQuery1.EOF do
    begin
      ComboBox1.Items.Add(ZQuery1.FieldByName('NAME').AsString);
      ZQuery1.Next;
    end;
  finally
    Self.Cursor := crDefault;
    ZQuery1.Unprepare;
    ZQuery1.Close;
    ZConnection1.Disconnect;
  end;

end;

procedure TForm2.Button2Click(Sender: TObject);
var
  settings: TIniFile;
begin
  settings := TIniFile.Create(iniFile);
  settings.WriteString('Connection', 'Host', ZConnection1.HostName);
  settings.WriteString('Connection', 'User', ZConnection1.User);
  settings.WriteString('Connection', 'Password', ZConnection1.Password);
  settings.WriteString('Database', 'Name', ComboBox1.Text);
  settings.Free;
  Self.Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  ComboBox1.Items.Clear;
end;

end.
