#!/usr/bin/env perl
use strict;
use warnings;

use lib 'lib';

use Time::HiRes qw( sleep );
use Term::ReadKey;
use Loop::Looper;
use Loop::Random::Sorter;

my $looper = Loop::Looper->new;
my $sorter = Loop::Random::Sorter->new;

print "Enter desired number of randomized strings:\n";
my $count_input = <STDIN>;
print "\nWould you like to sort the strings by numerics? (y/n)\n";
my $sort_input = <STDIN>;

my $key;
my $i=0;
my @load  = qw( / - \ | );
my @randomized;

ReadMode 4;

while ( ( scalar @randomized < $count_input ) && (!defined ($key = ReadKey(-1)))) {
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
if ($sort_input =~ /^y/i) {
    print "\nSorted by numerics:\n".join ("\n", @sorted)."\n\n";
}
else {
    print "\nRandomized strings:\n".join ("\n", @randomized)."\n"
}

1;
