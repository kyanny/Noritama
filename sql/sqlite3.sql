CREATE TABLE posts (
  id INTEGER PRIMARY KEY,
  post_id TEXT,
  created_at TEXT,
  updated_at TEXT,
  deleted_at TEXT
);
CREATE INDEX index_posts_on_post_id ON posts (post_id);