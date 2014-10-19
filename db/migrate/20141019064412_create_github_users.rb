class CreateGithubUsers < ActiveRecord::Migration
  def change
    create_table :github_users do |t|
      t.references :location, index: true

      t.timestamps
    end
  end
end
