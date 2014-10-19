class ChangeTypeOfGithubUserIdGithubPushEvents < ActiveRecord::Migration
  def change
    change_column 'github_push_events', :github_user_id, :string
  end
end
