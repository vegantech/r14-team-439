class AddCommitCountToGithubRepos < ActiveRecord::Migration
  def change
    add_column :github_repos, :commit_count, :int
  end
end
