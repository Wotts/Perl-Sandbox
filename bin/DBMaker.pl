#!/usr/bin/env perl
use strict;
use warnings;

use lib 'lib';

use Loop::DB::DBHandler qw( db_handle );

my $dbh = db_handle('strings.db');

my $sql_database = <<"SQL";
CREATE TABLE IF NOT EXISTS strings (
    id      INTEGER         PRIMARY KEY,
    string  VARCHAR(255)    NOT NULL,
    date    INTEGER         NOT NULL
);
SQL

$dbh->do($sql_database);

1;
