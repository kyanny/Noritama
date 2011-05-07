CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  post_id varchar(255) not null,
  body TEXT,
  created_at datetime not null,
  updated_at datetime not null
);

CREATE INDEX index_posts_on_post_id ON posts (post_id);