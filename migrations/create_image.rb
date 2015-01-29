class CreateImage < ActiveRecord::Migration

  def up
    create_table :images do |t|
      t.string  :url
      t.integer  :caption
      t.integer :filesize
      t.integer :post_id
    end
  end

  def down
    drop_table :images
  end

end