class AddEventTimeToGithubPushEvents < ActiveRecord::Migration
  def change
    add_column :github_push_events, :event_time, :timestamp
  end
end
