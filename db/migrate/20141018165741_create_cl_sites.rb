class CreateClSites < ActiveRecord::Migration
  def change
    create_table :cl_sites do |t|
      t.string :region, null: false
      t.string :subregion, null: false
      t.string :name, null: false
      t.string :base_url, null: false

      t.timestamps
    end
  end
end
