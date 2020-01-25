package Giphenator::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config( namespace => '' );

=encoding utf-8

=head1 NAME

Giphenator::Controller::Root - Root Controller for Giphenator

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index : Path : Args(0) Consumes(JSON) {
	my ( $self, $c ) = @_;

	#cargo culting like a boss
	my $req = ( my $c = pop )->req->body_data;
	if ( $req->{searchstring} ) {

		# TODO giphy things
		$c->stash->{pass} = 'found';

		# TODO catch user
		# TODO Associate last gif with user
		$c->stash->{msg} = {
			img  => 'https://media1.giphy.com/media/MAFTqETY2itA4/giphy.gif?cid=790b7611929cdb1d959c5c1b4fc60528d7f3cbd9c04157d3&rid=giphy.gif',
			tags => '#dancing with myself'
		};
	} elsif ( $req->{gifresponses} ) {

		# get last gif from user
		# add/ act on gif responses (save, medal, etc)
	} else {
		$c->stash->{fail} = 'Invalid Action';
	}

	$c->forward( 'View::JSON' );
}

=head2 default

Standard 404 error page

=cut

sub default : Path {
	my ( $self, $c ) = @_;

	# TODO $c->failmsg ?
	$c->stash->{fail} = 1;
	$c->stash->{msg}  = 'Not found';
	$c->forward( 'View::JSON' );
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') { }

=head1 AUTHOR

,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
