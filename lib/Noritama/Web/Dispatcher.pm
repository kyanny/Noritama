package Noritama::Web::Dispatcher;
use strict;
use warnings;
use Amon2::Web::Dispatcher::Lite;

get '/' => sub {
    my ($c) = @_;
    $c->render('index.tt');
};

get '/api' => sub {
    my ($c) = @_;
};

post '/api' => sub {
    my ($c) = @_;
};

get '/api/:post_id' => sub {
    my ($c) = @_;
};

any [qw/PUT/] => '/api/:post_id' => sub {
    my ($c) = @_;
};

any [qw/DELETE/] => '/api/:post_id' => sub {
    my ($c) = @_;
};

1;
