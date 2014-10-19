class GithubRepo < ActiveRecord::Base
  belongs_to :github_user
  has_many :github_push_events
  has_many :languages, through: :repo_language_stats
end
