class CreateGithubCommits < ActiveRecord::Migration
  def change
    create_table :github_commits do |t|
      t.references :github_push_event, index: true

      t.timestamps
    end
  end
end
