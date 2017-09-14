use strict;
use warnings;
use lib 'lib';

use Test::More;
use Loop::Looper;

use Loop::Random::Sorter;
use Data::Dumper;

my $randomizer = Loop::Looper->new;
my $sorter     = Loop::Random::Sorter->new;

my @randomized = $randomizer->randomlooper;
my @sorted = $sorter->sort_strings(@randomized);

ok(@randomized, 'Randomized array is defined');
ok(@sorted, 'Sorted array is defined');

done_testing();
