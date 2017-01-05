# README

This README would normally document whatever steps are necessary to get the
application up and running.

I normally don't copy READMEs.. I like to write it from scratch:

  L E X  installation

Item        Source code  Destination
Lex          lexgen.a    /usr/bin/lex
C library    lexcl.a     /lib/libl.a and /lib/liblc.a
Ratfor lib.  lexrl.a     /lib/liblr.a
C lookup     lexcl.a     /usr/lib/lex/ncform
Ratfor look  lexrl.a     /usr/lib/lex/nrform

There is only one subdirectory: "verify", which contains tests.
Its contents are used as follows: "name.l" is a Lex
source which when compiled produces "name.DIAG" if any
and an a.out file.  The a.out, given "name.IN" as input
makes "name.OUT" as output.  This is all checked by the
shell procedure in "verify/check".

There are several interesting shell procedures.

1. "make lex" compiles a new Lex.

2. "makclib" makes a new C Lex library.

3. "makrlib" makes a new Ratfor Lex library.

4. "verify/COMMANDS" checks out a new version of Lex
   against the test programs.

5. "install" compiles a new Lex and tests it.

There is no systematic test procedure for Ratfor Lex
at the present time.

To install Lex an appropriate sequence might be
1. Create the directories /usr/lex and /usr/lib/lex;
   and be allowed to write in them and in /lib.

2. Execute the commands

   chdir /usr/lex

   sh makclib
   cp liblc.a /lib/liblc.a
   cp ncform /usr/lib/lex/ncform
   ln /lib/liblc.a /lib/libl.a

   sh makrlib
   cp liblr.a /lib/liblr.a
   cp nrform /usr/lib/lex/nrform

   sh install
   cp lex /usr/bin/lex
   rm liblc.a liblr.a maklex lex nrform ncform

Needless to say, do not ignore error messages that appear in the sequence.

The Lex writeup is in /sys/doc/lex/lexmemo
and is printed via:

 tbl /sys/doc/lex/lexmemo | nroff -ms
