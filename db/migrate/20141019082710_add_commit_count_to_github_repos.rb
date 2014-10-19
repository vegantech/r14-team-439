class AddCommitCountToGithubRepos < ActiveRecord::Migration
  def change
    add_column :github_repos, :commit_count, :string
  end
end
