#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 3;

use lib './lib';
use lib './t';

use Giphenator::Schema::Result::LastSearched;
use Catalyst::Test 'Giphenator';
use t::Helpers;

BEGIN{
    use_ok('Test::WWW::Mechanize::Catalyst' => 'Giphenator');
};

t::Helpers->setup_database();

my $user = Test::WWW::Mechanize::Catalyst->new();
my $last_searched_result_set = Giphenator::Schema::Result::LastSearched->new();
my $gif_result_set = Giphenator::Schema::Result::Gif->new();

subtest '# Root request / returns success' => sub {
    $user->get_ok('/', 'Request should succeed');
};

subtest '# Save last /save_last saves the last retrived gif from the user' => sub {

    $last_searched_result_set->insert({user_id => 1, url => 'https://media.giphy.com/media/bMoMuUUUbff2g/giphy.gif'});

    $user->get_ok('/save_last', 'Request should succeed');

    ok(!$last_searched_result_set->first(), 'There should be no last searched left in the table');
    
    my $gif = $gif_result_set->first();
    ok($gif, 'A gif is returned form the database');
    ok($gif->{user_id} == 1, 'The returned gif should be related to the user that saved it');
    ok($gif->{url} eq 'https://media.giphy.com/media/bMoMuUUUbff2g/giphy.gif', 'The saved gif should have the correct giphy url');

    $gif->delete;
};

subtest '# Save last /save_last returns message where no last searched image exists' => sub {

    $user->get_ok('/save_last', 'Request should return a error message');

    is($user->ct, 'application/json', 'Check content type is json');
    $user->content_contains('There is no previous search history, please search for a gif before trying to save one');
};

done_testing();

1;