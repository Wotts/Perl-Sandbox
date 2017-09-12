#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper qw( Dumper );
use Time::HiRes qw( sleep );
use Term::ReadKey;

use Random::Randomizer qw( randomize_string randomize_numbers );
use Random::Sorter qw( sort_strings );

ReadMode 4;
my $key;

#$| = 1;
my $i=0;

my @load  = qw( / - \ | );

my @chars  = ("A".."Z", "a".."z");
my @nrs    = ("0".."9");
my @randomized;

my %even_odd;

my $sorter     = Random::Sorter->new;
my $randomizer = Random::Randomizer->new;

while ( ( scalar @randomized < 300 ) && (!defined ($key = ReadKey(-1)))) {
    my $seconds = $i/10;
    printf "Loading... $load[$i % 4] for %.1f seconds... The current time is: %d\r", $seconds, time;

    my $randomchars = $randomizer->randomize_string(\@chars, 8);
    my $randomnrs   = $randomizer->randomize_numbers(\@nrs, 8);

    $even_odd{$randomnrs} = $randomnrs % 2 ? 'odd' : 'even';

    my $randomstring = $randomchars.$randomnrs;
    push @randomized, "$randomstring";
    sleep 0.1;
    $i++;
}

ReadMode 0;

my @sorted = $sorter->sort_strings(@randomized);

print "\nRandomized strings:\n".join ("\n", @randomized)."\n";
print "\nSorted by numerics:\n".join ("\n", @sorted)."\n\n";
print "Amount of randomized strings:";
print scalar @sorted;
print "\n";
print "$_ is an $even_odd{$_} number.\n" foreach (sort {$a <=> $b} (keys%even_odd));

1;
