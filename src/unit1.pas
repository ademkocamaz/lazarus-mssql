unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, DB, Forms, Controls, Dialogs, StdCtrls, Unit2,
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
    ShowMessage('Empty SQL!');
    Log('Empty SQL!');
    Exit;
  end;
  try
    try
      ZConnection1.Connected := True;
      Log(Memo1.Lines.Text);
      ZQuery1.SQL := Memo1.Lines;
      if not ZQuery1.Prepared then
        ZQuery1.Prepare;
      ZQuery1.Open;
    except
      on Exc: Exception do
      begin
        ShowMessage(Exc.Message);
        Log(Exc.Message);
      end;

    end;
  finally
    ZQuery1.Prepared := False;
  end;
end;

end.
