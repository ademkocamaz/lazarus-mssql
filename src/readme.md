Contents of this directory
==========================

The zip-files in this directory contain the FreeTDS dblib implementation in the two flavours
32 bits 64 bits. Both are dynamicaly linked to libiconv. They are
provided here for Zeos users that don't want to compile their own libs.

Libraries built by the FreeTDS project can be fond on:
https://ci.appveyor.com/project/FreeTDS/freetds/history

If you need anything else go to www.freetds.org, get the source and compile
FreeTDS yourself. Instructions on how to do that can be found on the Zeoslib
Wiki:
https://sourceforge.net/p/zeoslib/wiki/Building%20FreeTDS%20with%20libiconv%20on%20Windows/

Although the files are named libsybdb-5.dll they really can communicate to Sybase
servers as well as Microsoft SQL Server.

On all Delphi unicode versions (Delphi 2009+) you almost always want to use
UTF-8 as the connection character set (and usually don't need these downloads). On Ansi versions of Delphi (Delphi 7
to Delphi 2007) it makes sense to choose your local character set as the Zeos
connection character set.

SSL /TLS Support
================
Starting with version 1.4.8 these builds are compiled with OpenSSL.
It might make sense to use the builds from the FreeTDS project if you need SSL support.
The OpenSSL builds in these downloads don't use the Windows certificate store.
They expect their own store in the default locations, OpenSSL expects.

License
=======
FreeTDS is licensed under the LGPL version 2.
libiconv is licensed under the LGPL version 2.1.
OpenSSL is licensed under an Apache-style license.

See the respective license files for details.