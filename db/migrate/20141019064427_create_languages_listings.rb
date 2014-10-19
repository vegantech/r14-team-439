class CreateLanguagesListings < ActiveRecord::Migration
  def change
    create_table :languages_listings do |t|
      t.belongs_to :language, index: true
      t.belongs_to :listing, index: true
    end
  end
end
