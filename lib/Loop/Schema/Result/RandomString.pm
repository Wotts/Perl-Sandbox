use utf8;
package Loop::Schema::Result::RandomString;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Loop::Schema::Result::RandomString

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<random_string>

=cut

__PACKAGE__->table("random_string");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 string

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 epoch_time

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 created_date

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "string",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "epoch_time",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "created_date",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2017-09-22 10:41:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:izuVVFiFyfJ7xsSLJqjZ1w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
