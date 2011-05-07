package Noritama::Model::Post::Schema;
use strict;
use warnings;
use Teng::Schema::Declare;
use Time::Piece::MySQL;

table {
    name 'posts';
    pk 'id';
    columns qw(
                  id
                  post_id
                  body
                  created_at
                  updated_at
          );

    inflate 'created_at' => sub {
        my ($col_value) = @_;
        return Time::Piece::MySQL->from_mysql_datetime($col_value);
    };
    deflate 'created_at' => sub {
        my ($col_value) = @_;
        return ref $col_value ? $col_value->mysql_datetime : $col_value;
    };

    inflate 'updated_at' => sub {
        my ($col_value) = @_;
        return Time::Piece::MySQL->from_mysql_datetime($col_value);
    };
    deflate 'updated_at' => sub {
        my ($col_value) = @_;
        return ref $col_value ? $col_value->mysql_datetime : $col_value;
    };
};

1;
