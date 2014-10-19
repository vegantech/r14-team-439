class GithubUser < ActiveRecord::Base
  belongs_to :location
  has_many :github_push_events
  has_many :github_repos
end
