use utf8;
package Giphenator::Schema::Result::GifTag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Giphenator::Schema::Result::GifTag

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 TABLE: C<gif_tag>

=cut

__PACKAGE__->table("gif_tag");

=head1 ACCESSORS

=head2 gif_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 tag_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "gif_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "tag_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</gif_id>

=item * L</tag_id>

=back

=cut

__PACKAGE__->set_primary_key("gif_id", "tag_id");

=head1 RELATIONS

=head2 gif

Type: belongs_to

Related object: L<Giphenator::Schema::Result::Gif>

=cut

__PACKAGE__->belongs_to(
  "gif",
  "Giphenator::Schema::Result::Gif",
  { id => "gif_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 tag

Type: belongs_to

Related object: L<Giphenator::Schema::Result::Tag>

=cut

__PACKAGE__->belongs_to(
  "tag",
  "Giphenator::Schema::Result::Tag",
  { id => "tag_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-02-01 22:19:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VtQWPTowPd19J3YrusGadA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
