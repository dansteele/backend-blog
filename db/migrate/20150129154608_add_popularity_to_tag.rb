class AddPopularityToTag < ActiveRecord::Migration
  def change
    add_column(:tags, :popularity, :integer)
  end
end
