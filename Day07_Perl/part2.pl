#!/usr/bin/env perl

use v5.10;
use Scalar::Util qw(looks_like_number);
use Data::Dumper qw(Dumper);

sub say {print @_, "\n"}

my $file = "input.txt";
open(my $fh, "<", "input.txt") or die "Unable to open < input.txt: $!";
my @lines = <$fh>;
chomp(@lines);
 
my %hash;

$hash{b} = 956;

for my $line (@lines) {
    $line =~ s/([a-z]+)/int(\$hash{$1})/g;
    $line =~ s/OR/|/ig;
    $line =~ s/AND/&/ig;
    $line =~ s/RSHIFT/>>/ig;
    $line =~ s/LSHIFT/<</ig;
    $line =~ s/(.+) ->(.+)/$2 = $1/ig;
    $line =~ s/NOT (.+)/~$1 & 0xffff/ig;
    $line =~ s/^ int\(([^)]+)\)/$1/ig;
    eval $line . ';';    
}

say $hash{a};