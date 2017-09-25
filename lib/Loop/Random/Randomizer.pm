package Loop::Random::Randomizer;

use Moose;


#Generate a random string with given characters and length
sub randomize_string {
    my $self = shift;
    my (
        $chars,
        $length,
    ) = @_;

    my $randomstring;
    $randomstring .= $chars->[rand @$chars] for 1..$length;
    return $randomstring;
}


#Generate a random string with given digits and length
sub randomize_numbers {
    my $self = shift;
    my (
        $numbers,
        $length,
    ) = @_;

    my $randomnumbers;
    $randomnumbers .= $numbers->[rand @$numbers] for 1..$length;
    return $randomnumbers;
}

1;
