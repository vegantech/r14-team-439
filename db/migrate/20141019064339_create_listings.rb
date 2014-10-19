class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :link
      t.text :title
      t.text :snippet
      t.references :region, index: true

      t.timestamps
    end
  end
end
