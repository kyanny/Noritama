package Noritama::API;
use strict;
use warnings;
use parent qw/Noritama Amon2::Web/;
use File::Spec;

# dispatcher
use Noritama::API::Dispatcher;
sub dispatch {
    return Noritama::API::Dispatcher->dispatch($_[0]) or die "response is not generated";
}

# load plugins
use HTTP::Session::Store::File;
__PACKAGE__->load_plugins(
    'Web::JSON',
);

# for your security
__PACKAGE__->add_trigger(
    AFTER_DISPATCH => sub {
        my ( $c, $res ) = @_;
        $res->header( 'X-Content-Type-Options' => 'nosniff' );
    },
);

__PACKAGE__->add_trigger(
    BEFORE_DISPATCH => sub {
        my ( $c ) = @_;
        # ...
        return;
    },
);

sub created {
    my ($c, $data) = @_;
    my $res = $c->render_json($data);
    $res->code(201);
    my $uri = $c->req->uri;
    $uri->path_segments('api', $data->{post_id});
    $res->header('Location' => $uri);
    return $res;
}

sub no_content {
    my $c = shift;
    my $res = $c->render_json({});
    $res->code(204);
    return $res;
}

sub bad_request {
    my ($c, $message) = @_;
    my $res = $c->render_json({"error" => $message});
    $res->code(400);
    return $res;
}

sub not_found {
    my ($c, $message) = @_;
    my $res = $c->render_json({"error" => $message});
    $res->code(404);
    return $res;
}

1;
