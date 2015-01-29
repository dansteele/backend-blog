class CreateAuthors < ActiveRecord::Migration

  def up
    create_table :authors do |t|
      t.string  :name
      t.string  :twitter
      t.timestamp
      t.integer :image_id
    end
  end

  def down
    drop_table :authors
  end

end