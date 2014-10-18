class CreateClSites < ActiveRecord::Migration
  def change
    create_table :cl_sites do |t|
      t.string :region
      t.string :subregion
      t.string :name
      t.string :base_url

      t.timestamps
    end
  end
end
