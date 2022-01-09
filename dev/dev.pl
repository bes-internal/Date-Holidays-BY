#!perl

chdir 'dev';
system 'carton';
chdir "..";
if (!-l "local") { symlink("dev/local", "local") or die $@; }
if (!-l "cpanfile.snapshot") { symlink("dev/cpanfile.snapshot", "cpanfile.snapshot") or die $@; }
system 'carton';

print "done\n";
