class Location < ActiveRecord::Base
  belongs_to :region
  has_many :github_users
  has_many :github_push_events, through: :github_users


  def self.commit_counts
    joins(:github_push_events).merge(GithubPushEvent.joins(:github_commits)).group("locations.name").count
  end
end
