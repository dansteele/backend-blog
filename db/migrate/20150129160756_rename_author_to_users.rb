class RenameAuthorToUsers < ActiveRecord::Migration
  def up
    rename_table(:authors, :users)
  end

  def down
    rename_table(:users, :authors )
  end
end
