package Noritama::Model::Post::Schema;
use strict;
use warnings;
use Teng::Schema::Declare;

table {
    name 'posts';
    pk 'id';
    columns qw(
                  post_id
                  body
                  created_at
                  updated_at
                  deleted_at
          );
};

1;
