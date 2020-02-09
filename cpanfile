requires 'Catalyst::View::JSON';
requires 'JSON';
requires 'DBI';
requires 'SQL::Abstract';

requires 'Catalyst::Runtime', '5.90126';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Helper::Model::DBIC::Schema';
requires 'DBIx::Class::Schema::Loader';
requires 'DBIx::Class::TimeStamp';
requires 'MooseX::NonMoose', '0.25';
requires 'Moose';
requires 'namespace::autoclean';
requires 'Config::General'; 

requires 'Test::More', '0.88';
requires 'Test::WWW::Mechanize::Catalyst';