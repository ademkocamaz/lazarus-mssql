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
  Unit2 { you can add units after this };

{$R *.res}

begin
  DebugLogger.LogName := 'log.txt';
  Log('logger started');
  RequireDerivedFormResource := True;
  Application.Scaled := True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
