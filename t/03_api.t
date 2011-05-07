use strict;
use warnings;
use t::Util;
use Plack::Test;
use Plack::Util;
use Test::More;
use HTTP::Request::Common;
use JSON;

my $app = Plack::Util::load_psgi 'app.psgi';
test_psgi
    app => $app,
    client => sub {
        my $cb = shift;
        my $req = POST('http://localhost/api/', [body => 'hogehoge']);
        my $res = $cb->($req);
        is $res->code, 201;
        my $data = decode_json $res->content;
        ok $data->{post_id};
        is $data->{body}, 'hogehoge';
        diag $res->content if $res->code != 201;
    };

done_testing;

