package Helpers;

use strict;
use warnings;

use DBICx::TestDatabase;
use Giphenator();
use Test::WWW::Mechanize::Catalyst 'Giphenator';

sub setup_database {

	my $schema_name = 'Giphenator::Schema';
	my $schema = DBICx::TestDatabase->new($schema_name);
	Giphenator->model('DB')->schema($schema);
	Giphenator->log->disable('warn');
}

1;