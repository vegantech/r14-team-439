class CreateGithubReposLanguages < ActiveRecord::Migration
  def change
    create_table :github_repos_languages do |t|
      t.belongs_to :github_repo, index: true
      t.belongs_to :language, index: true
    end
  end
end
