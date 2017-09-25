#!/usr/bin/env perl
use strict;
use warnings;

use lib 'lib';

use Loop::DB::DBHandler qw( db_handle );


#Configure and setup our databasehandle using a helperfunction
my $dbh = db_handle('db/randomized_strings.db');


#Define the table that is to be created
my $sql_database = <<"SQL";
CREATE TABLE IF NOT EXISTS random_string (
    id              INTEGER         PRIMARY KEY,
    string          VARCHAR(255)    NOT NULL,
    epoch_time      VARCHAR(255)    NOT NULL,
    lucky           VARCHAR(255),
    created_date    TIMESTAMP       DEFAULT CURRENT_TIMESTAMP
);
SQL

$dbh->do($sql_database);

1;
