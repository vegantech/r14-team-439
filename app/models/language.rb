class Language < ActiveRecord::Base
  has_and_belongs_to_many :listings
  has_many :github_repos, through: :github_repo_stats
end
