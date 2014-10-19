class CreateGithubRepos < ActiveRecord::Migration
  def change
    create_table :github_repos do |t|
      t.references :github_user, index: true

      t.timestamps
    end
  end
end
