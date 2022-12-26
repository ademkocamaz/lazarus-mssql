unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, ComboEx, ZConnection;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    ZConnection1: TZConnection;
    procedure Button1Click(Sender: TObject);
    procedure LabeledEdit2Change(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
  ZConnection1.HostName := LabeledEdit1.Text;
  ZConnection1.User := LabeledEdit2.Text;
  ZConnection1.Password := LabeledEdit3.Text;

end;

procedure TForm2.LabeledEdit2Change(Sender: TObject);
begin

end;

end.
