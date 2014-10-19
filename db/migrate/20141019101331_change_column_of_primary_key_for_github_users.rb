class ChangeColumnOfPrimaryKeyForGithubUsers < ActiveRecord::Migration
  def up 
    change_column :github_users, :id, :string, devault: nil
    remove_column :github_users, :username
    add_column :github_users, :idnumber, :integer
  end

  def down
    remove_column :github_users, :idnumber
    add_column :github_users, :username, :integer
  end
end
