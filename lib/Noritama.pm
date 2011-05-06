package Noritama;
use strict;
use warnings;
use parent qw/Amon2/;
our $VERSION='0.01';
use 5.008001;
use Noritama::Model::Post;

# __PACKAGE__->load_plugin(qw/DBI/);

sub teng {
    my $self = shift;
    if (!defined $self->{teng}) {
        my $c = $self->config->{Teng};
        $self->{teng} = Noritama::Model::Post->new(connect_info => $c);
    }
    $self->{teng};
}

1;
