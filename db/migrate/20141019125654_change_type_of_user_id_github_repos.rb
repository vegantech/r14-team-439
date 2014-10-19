class ChangeTypeOfUserIdGithubRepos < ActiveRecord::Migration
  def change
    change_column 'github_repos', :github_user_id, :string
  end
end
