package Giphenator::Schema::ResultSet::LastSearched;
 
use strict;
use warnings;
use base 'DBIx::Class::ResultSet';

sub by_user_id {
	my ($self, $user_id) = @_;

	return $self->search({user_id => { '==' => $user_id } }); 
}

1;