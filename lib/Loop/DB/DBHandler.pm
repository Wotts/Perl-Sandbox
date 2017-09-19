package Loop::DB::DBHandler;

use strict;
use warnings;

use DBI;
use Carp qw( croak );
use Exporter::NoWork;

sub db_handle {
    my $db_file = shift
        or croak "db_handle() requires a database name.";
    no warnings 'once';
    return DBI->connect(
        "dbi:SQLite:dbname=$db_file",
        "", #no username required
        "", #no password required
        {
            RaiseError => 1,
            PrintError => 1,
            AutoCommit => 1,
        },
    ) #or die $DBH::errstr;
}

1;
