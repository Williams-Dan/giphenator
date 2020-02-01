use utf8;
package Giphenator::Schema::Result::Tag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Giphenator::Schema::Result::Tag

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

=head1 TABLE: C<tags>

=cut

__PACKAGE__->table("tags");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 created

  data_type: 'timestamp'
  is_nullable: 1

=head2 updated

  data_type: 'timestamp'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "created",
  { data_type => "timestamp", is_nullable => 1 },
  "updated",
  { data_type => "timestamp", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 gif_tags

Type: has_many

Related object: L<Giphenator::Schema::Result::GifTag>

=cut

__PACKAGE__->has_many(
  "gif_tags",
  "Giphenator::Schema::Result::GifTag",
  { "foreign.tag_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 gifs

Type: many_to_many

Composing rels: L</gif_tags> -> gif

=cut

__PACKAGE__->many_to_many("gifs", "gif_tags", "gif");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-02-01 22:19:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DJkaI52FVUIDmumA+riX2A


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->many_to_many(gifs => 'gif_tags', 'gif');

__PACKAGE__->meta->make_immutable;
1;
