program project1;

{$mode objfpc}{$H+}

uses
  Interfaces, // this includes the LCL widgetset
  Forms,
  runtimetypeinfocontrols,
  LazLogger,
  virtualdbgrid_package,
  Unit1,
  zcomponent,
  Unit2, Unit3 { you can add units after this };

{$R *.res}

begin
  DebugLogger.LogName := 'log.txt';
  Log('logger started');
  RequireDerivedFormResource := True;
  Application.Scaled := True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
