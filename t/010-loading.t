use strict;
use warnings;
use lib 'lib';

use Test::More;
use Data::Dumper;

use DBIx::Class;
use Loop::Looper;
use Loop::Random::Sorter;
use Loop::Schema;



my $generator = Loop::Looper->new;
my $sorter    = Loop::Random::Sorter->new;

my $now = time;
my $schema = Loop::Schema->connect('dbi:SQLite:dbname=:memory:');
$schema->load_namespaces;
$schema->deploy;



#Test the randomgenerator en sorting functionality
my @randomized;
for (1..20) {
    push @randomized, $generator->randomgenerator;
}
my @sorted = $sorter->sort_strings(@randomized);

ok(@randomized, 'Randomized array is defined');
ok(@sorted, 'Sorted array is defined');



#Test the databasefunctionality
$schema->resultset('RandomString')->populate([
    [ qw( string epoch_time ) ],
    map { [ $_, $now ] } @sorted,
]);

my $result = $schema->resultset('RandomString')->search(
    {epoch_time => $now},
    {rows => 10},
);

while (my $r = $result->next) {
    diag($r->string, ' ... ', $r->epoch_time)
}
ok($result, 'Resultset is defined');

done_testing();
