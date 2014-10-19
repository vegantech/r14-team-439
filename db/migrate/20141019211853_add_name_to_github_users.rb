class AddNameToGithubUsers < ActiveRecord::Migration
  def change
    add_column :github_users, :name, :string
  end
end
