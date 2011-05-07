package Noritama::Web::Dispatcher;
use strict;
use warnings;
use Amon2::Web::Dispatcher::Lite;

get '/' => sub {
    my ($c) = @_;
    $c->render('index.tt');
};

1;
