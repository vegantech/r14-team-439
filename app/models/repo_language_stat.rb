class RepoLanguageStat < ActiveRecord::Base
  belongs_to :github_repo
  belongs_to :language
end
