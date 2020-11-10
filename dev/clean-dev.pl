#!perl
`carton exec dzil clean`;
require "./local/lib/perl5/File/Path/Tiny.pm";
File::Path::Tiny::rm("dev/local");
if (-e "dev/cpanfile.snapshot") {unlink "dev/cpanfile.snapshot" or die $@;}
if (-l "local") {unlink "local" or die $@;}
if (-l "cpanfile.snapshot") {unlink "cpanfile.snapshot" or die $@;}

print "done\n";
