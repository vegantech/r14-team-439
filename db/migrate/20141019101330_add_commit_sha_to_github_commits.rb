class AddCommitShaToGithubCommits < ActiveRecord::Migration
  def change
    add_column :github_commits, :commit_sha, :string
  end
end
