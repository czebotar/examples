#!/usr/bin/perl -w
#
# This is a basic example using an array to sort a string list in PERL.    

my $temp = "2,4,5,1,0,3,6,10,9,7,8";
my @array=();

#splitting string into array
@array=split(",", $temp );

foreach (@array)
{
 if ($_ =~ /\d+/)
 {
  print $_ . "   ";
  
 }
}
#sorting array
@array=sort{ $a <=> $b } @array;

#rebuilding array
$temp = join(",",@array);

print "\n". $temp . "\n";

