class GithubCommit < ActiveRecord::Base
  belongs_to :github_push_event
end
