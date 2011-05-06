package Noritama::Model::Post;
use strict;
use warnings;
use parent 'Teng';
use Mouse;
use Data::UUID;
use Time::Piece::MySQL;

before 'insert' => sub {
    my ($self, $table_name, $row_data, $prefix) = @_;
    $row_data->{post_id} = Data::UUID->new->create_str;
    $row_data->{created_at} = localtime->mysql_datetime;
    $row_data->{updated_at} = localtime->mysql_datetime;
};

before 'update' => sub {
    my ($self, $table_name, $update_row_data, $update_condition) = @_;
    $update_row_data->{updated_at} = localtime->mysql_datetime;
};

1;
