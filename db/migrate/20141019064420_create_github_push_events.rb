class CreateGithubPushEvents < ActiveRecord::Migration
  def change
    create_table :github_push_events do |t|
      t.references :github_repo, index: true
      t.references :github_user, index: true

      t.timestamps
    end
  end
end
