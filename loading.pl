#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper qw( Dumper );
use Time::HiRes qw( sleep );
use Term::ReadKey;

ReadMode 4;
my $key;

$| = 1;
my $i=0;

my @load  = qw( / - \ | );

my @chars = ("A".."Z", "a".."z");
my @nrs   = ("0".."9");
my @randomized;

my %even_odd;


while ( ( scalar @randomized < 300 ) && (!defined ($key = ReadKey(-1)))) {
    my $seconds = $i/10;
    printf "Loading... $load[$i % 4] for %.1f seconds... The current time is: %d\r", $seconds, time;

    my $randomchars;
    $randomchars .= $chars[rand @chars] for 1..8;
    my $randomnrs;
    $randomnrs .= $nrs[rand @nrs] for 1..8;

    $even_odd{$randomnrs} = $randomnrs % 2 ? 'odd' : 'even';

    my $randomstring = $randomchars.$randomnrs;
    push @randomized, "$randomstring";
    sleep 0.1;
    $i++;
}

my @sorted = map  { $_->[0] }
             sort { $a->[1] <=> $b->[1] }
             map  { /(\d+)/; [ $_, $1 ] } @randomized;

print "\nRandomized strings:\n".join ("\n", @randomized)."\n";
print "\nSorted by numerics:\n".join ("\n", @sorted)."\n\n";
print "Amount of randomized strings:";
print scalar @sorted;
print "\n";
print "$_ is an $even_odd{$_} number.\n" foreach (sort {$a <=> $b} (keys%even_odd));
print Dumper (sort {$a <=> $b} (\%even_odd));
ReadMode 0;

1;
