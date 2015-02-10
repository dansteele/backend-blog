class AddUsernameToUsers < ActiveRecord::Migration
  def self.up
    add_column(:users, :username, :text)
  end

  def self.down
    remove_column(:users, :username, :text)
  end
end
