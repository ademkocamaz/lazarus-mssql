unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, LazLoggerBase;
procedure Log(message: string);

implementation

procedure Log(message: string);
begin
  DebugLn(DateTimeToStr(Now) + ' : ' + message);
end;

end.
