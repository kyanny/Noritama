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

    return $c->bad_request("`body' is required") unless $c->req->param('body');

    my $row = $c->teng->insert('posts', {
        body => $c->req->param('body'),
    }, 'INSERT INTO');

    return $c->render_json($row->get_columns);
};

get '/:post_id' => sub {
    my ($c, $args) = @_;

    my $row = $c->teng->single('posts', {post_id => $args->{post_id}});
    return $c->not_found unless $row;

    return $c->render_json($row->get_columns);
};

any [qw/PUT/] => '/:post_id' => sub {
    my ($c, $args) = @_;

    my $row = $c->teng->single('posts', {post_id => $args->{post_id}});
    return $c->not_found unless $row;

    $row->update({body => $c->req->param('body')}) if $c->req->param('body');

    return $c->render_json($row->get_columns);
};

any [qw/DELETE/] => '/:post_id' => sub {
    my ($c) = @_;
    return $c->render_json([""]);
};

1;
