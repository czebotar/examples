#!/usr/bin/perl -w
if ($#ARGV != 2 ) {
        print "Minimum of three arguments\n\nSyntax:\nargv.pl arg1 arg2 arg3 \n";
        exit;
}
$n1=$ARGV[0];
$n2=$ARGV[1];
$n3=$ARGV[2];

print "$n1 $n2 $n3  \n";

