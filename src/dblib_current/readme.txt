Pre-compiled DLLs for Windows

 Win32
  dblib.dll      - compiled using VC++ 2005
  dblib_2000.dll - compiled using VC++ 2005 with hardcoded TDS protocol version 7.1 (SQL Server 2000); based on FreeTDS 0.91
  dblib_2008.dll - compiled using VC++ 2005 with hardcoded TDS protocol version 7.3 (SQL Server 2008)
  (with ICONV support; requires libiconv2.dll)

 Win64
  dblib.dll      - compiled using VC++ 2010
  dblib_2000.dll - compiled using VC++ 2010 with hardcoded TDS protocol version 7.1 (SQL Server 2000)
  dblib_2008.dll - compiled using VC++ 2010 with hardcoded TDS protocol version 7.3 (SQL Server 2008)
  (with ICONV support; requires libiconv.dll)

 VC
  Visual Studio Solution/Project files used to compile libraries

Note:
  Other FreeTDS builds can be found also at: https://ci.appveyor.com/project/FreeTDS/freetds