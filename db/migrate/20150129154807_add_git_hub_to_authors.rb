class AddGitHubToAuthors < ActiveRecord::Migration
  def change
    add_column(:authors, :github, :text)
  end
end