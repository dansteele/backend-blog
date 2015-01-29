class CreatePost < ActiveRecord::Migration

  def up
    create_table :posts do |t|
      t.string  :body
      t.integer  :title
      t.timestamp
      t.integer :user_id
    end
  end

  def down
    drop_table :posts
  end

end