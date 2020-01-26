#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;

use Catalyst::Test 'Giphenator';

BEGIN{
    use_ok(Test::WWW::Mechanize::Catalyst => Giphenator);
    $ENV{ MYAPP_CONFIG_LOCAL_SUFFIX } = 'test';
};

my $user = Test::WWW::Mechanize::Catalyst->new;

subtest '# Root request / returns success' => sub {
    $user->get_ok('/', 'Request should succeed');
};

subtest '# Save last /savelast saves the last retrived gif from the user' => sub {
    # Add record into last searched

    $user->get_ok('/savelast', 'Request should succeed');

    # Assert record no longer in last searched
    # Assert record now in table
}

subtest '# Save last /savelast returns message where no last searched image exists' => sub {

    $user->get_ok('/savelist', 'Request should return a error message');

    is($user->ct, 'application/json', 'Check content type is json');
    $user->content_contains('There is no previous search history, please search for a gif before trying to save one');
}

done_testing();

1;