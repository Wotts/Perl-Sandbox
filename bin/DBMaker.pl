#!/usr/bin/env perl
use strict;
use warnings;

use lib 'lib';

use Loop::DB::DBHandler qw( db_handle );

my $dbh = db_handle('db/randomized_strings.db');

my $sql_database = <<"SQL";
CREATE TABLE IF NOT EXISTS strings (
    id              INTEGER         PRIMARY KEY,
    random_string   VARCHAR(255)    NOT NULL,
    epoch_time      VARCHAR(255)    NOT NULL,
    created_date    TIMESTAMP       DEFAULT CURRENT_TIMESTAMP
);
SQL

$dbh->do($sql_database);

1;
