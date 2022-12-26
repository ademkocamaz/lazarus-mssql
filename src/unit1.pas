unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, DB, Forms, Controls, Dialogs, StdCtrls,
  VirtualDBGrid, ZConnection, ZDataset;

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
    procedure FormCreate(Sender: TObject);
  private
    procedure Log(message: string);
    procedure ClearLogs();
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Memo1.Lines.Text = string.Empty then
  begin
    ShowMessage('Empty SQL!');
    Exit;
  end;

  try
    Log('Connecting..');
    ZConnection1.Connected := True;
    Log('Connected..');
    Log('Table opening..');
    ZQuery1.SQL := Memo1.Lines;
    ZQuery1.Open;
    Log('Table opened..');
  except
    on Exc: Exception do
    begin
      ShowMessage(Exc.Message);
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Lines.Clear;
  ZQuery1.SQL.Clear;
  ListBox1.Items.Clear;
end;

procedure TForm1.Log(message: string);
begin
  ListBox1.Items.Add(message);
end;

procedure TForm1.ClearLogs;
begin
  ListBox1.Items.Clear;
end;

end.
