use strict;
use warnings;
use Test::More;

use_ok $_ for qw(
    Noritama
    Noritama::Web
    Noritama::Web::Dispatcher
    Noritama::API
    Noritama::API::Dispatcher
);

done_testing;
