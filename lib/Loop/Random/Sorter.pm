package Loop::Random::Sorter;

use Moose;

sub sort_strings {
    my $self = shift;
    my @sorted =
        map  { $_->[0] }
        sort { $a->[1] <=> $b->[1] }
        map  { /(\d+)/; [ $_, $1 ] } @_;

        return @sorted;
}

1;
