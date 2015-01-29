class CreateComment < ActiveRecord::Migration

  def up
    create_table :comments do |t|
      t.string  :body
      t.integer  :kudos
      t.timestamp
      t.integer :user_id
      t.integer :post_id
    end
  end

  def down
    drop_table :comments
  end

end