package Noritama::API::Dispatcher;
use strict;
use warnings;
use Amon2::Web::Dispatcher::Lite;

get '/' => sub {
    my ($c) = @_;

    my @rows = map { $_->get_columns } $c->teng->search('posts', {}, {'order_by' => 'created_at DESC'});

    return $c->render_json(\@rows);
};

post '/' => sub {
    my ($c) = @_;
    return $c->render_json([""]);
};

get '/:post_id' => sub {
    my ($c) = @_;
    return $c->render_json([""]);
};

any [qw/PUT/] => '/:post_id' => sub {
    my ($c) = @_;
    return $c->render_json([""]);
};

any [qw/DELETE/] => '/:post_id' => sub {
    my ($c) = @_;
    return $c->render_json([""]);
};

1;
