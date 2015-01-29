class CreatePosts < ActiveRecord::Migration

  def up
    create_table :posts do |t|
      t.string  :body
      t.integer  :title
      t.timestamp
      t.integer :author_id
    end
  end

  def down
    drop_table :posts
  end

end