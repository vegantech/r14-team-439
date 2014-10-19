class GithubPushEvent < ActiveRecord::Base
  belongs_to :github_repo
  belongs_to :github_user
  has_many :github_commits
end
