class GithubRepo < ActiveRecord::Base
  belongs_to :github_user
  has_many :github_push_events
  has_and_belongs_to_many :languages
end
