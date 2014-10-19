class Language < ActiveRecord::Base
  has_and_belongs_to_many :listings
  has_and_belongs_to_many :github_repos
end
