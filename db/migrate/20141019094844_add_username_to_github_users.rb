class AddUsernameToGithubUsers < ActiveRecord::Migration
  def change
    add_column :github_users, :username, :string
  end
end
