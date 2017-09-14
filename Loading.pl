#!/usr/bin/env perl
use strict;
use warnings;
use Time::HiRes qw( sleep );
use Term::ReadKey;
use Loop::Looper;
use Loop::Random::Sorter;

my $looper = Loop::Looper->new;
my $sorter = Loop::Random::Sorter->new;

my $key;
my $i=0;
my @load  = qw( / - \ | );
my @randomized;

ReadMode 4;

while ( ( scalar @randomized < 300 ) && (!defined ($key = ReadKey(-1)))) {
    my $seconds = $i/10;
    printf "Loading... $load[$i % 4] for %.1f seconds... The current time is: %d\r", $seconds, time;

    my $randomstring = $looper->randomlooper;
    push @randomized, "$randomstring";

    sleep 0.1;
    $i++;
}

ReadMode 0;

my @sorted = $sorter->sort_strings(@randomized);

print "\nGenerated ", scalar @randomized, " randomized strings.\n";
print "\nRandomized strings:\n".join ("\n", @randomized)."\n";
print "\nSorted by numerics:\n".join ("\n", @sorted)."\n\n";

1;
