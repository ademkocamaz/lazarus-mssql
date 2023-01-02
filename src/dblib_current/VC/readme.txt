- rename in include/:
	config.h.in		-> config.h
	tds_sysdep_public.h.in	-> tds_sysdep_public.h	(+ replace "@dblib_define@" with "#define MSDBLIB 1")

- add to config.h:
	#define HAVE_ERRNO_H 1
	#define HAVE_ICONV 1
	#define HAVE_GETADDRINFO 1
	#define HAVE_GETHOSTNAME 1
	#define HAVE_LIMITS_H 1
	#define HAVE_LOCALE_H 1
	#define HAVE_MALLOC_H 1
	#define HAVE_MEMORY_H 1
	#define HAVE_SSPI 1
	#define HAVE_STDLIB_H 1
	#define HAVE_STRING_H 1
	#define HAVE_SYS_TYPES_H 1
	#define HAVE_WCHAR_H 1
	#define HAVE__VSNPRINTF 1
	#define STDC_HEADERS 1
	#define TDS_I64_PREFIX "I64"
	#define TDS73 1
	#define VERSION "1.3"

	#ifdef _MSC_VER
	#define inline __inline
	#endif

For Visual Studio 2005 Express:
===============================
1. Install the Microsoft Platform SDK for Windows 7 over the Web. At a minimum, you will need to install the Windows Core SDK.
2. From the Tools menu in Visual Studio, select Options.
   From the Options dialog box, expand the Projects and Solutions node and select VC++ Directories. In that section, add the following paths to the appropriate subsection:
    Include files: C:\Program Files\Microsoft SDKs\Windows\v7.1\include
    Library files: C:\Program Files\Microsoft SDKs\Windows\v7.1\lib
3. Update the corewin_express.vsprops file (found in %VSINSTALLDIR%\VC\VCProjectDefaults) and change the string that reads:
    AdditionalDependencies="kernel32.lib"
   to:
    AdditionalDependencies="kernel32.lib user32.lib shell32.lib"