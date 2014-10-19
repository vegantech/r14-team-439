class AddNameToGithubRepos < ActiveRecord::Migration
  def change
    add_column :github_repos, :name, :string
  end
end
