class AddDobTcPassword1AndPassword2ColumnsToUsersTable < ActiveRecord::Migration
  def change
    add_column(:users, :dob, :text)
    add_column(:users, :password1, :text)
    add_column(:users, :password2, :text)
    add_column(:users, :tc, :boolean)
  end
end
