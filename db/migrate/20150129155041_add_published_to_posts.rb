class AddPublishedToPosts < ActiveRecord::Migration
  def change
    add_column(:posts, :published, :integer)
  end
end