class RenamePassword1ToPasswordInUserTable < ActiveRecord::Migration
  def up
    rename_column(:users, :password1, :password)
  end

  def down
    rename_column(:users, :password, :password1)
  end
end
