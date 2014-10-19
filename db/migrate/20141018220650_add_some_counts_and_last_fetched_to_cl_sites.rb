class AddSomeCountsAndLastFetchedToClSites < ActiveRecord::Migration
  def change
    add_column :cl_sites, :last_fetched, :datetime
    add_column :cl_sites, :total_entries, :int, default: 0, null: false
    add_column :cl_sites, :no_matches, :int, default: 0, null: false
    add_column :cl_sites, :ruby, :int, default: 0, null: false
    add_column :cl_sites, :python, :int, default: 0, null: false
    add_column :cl_sites, :java, :int, default: 0, null: false
    add_column :cl_sites, :javascript, :int, default: 0, null: false
  end
end
