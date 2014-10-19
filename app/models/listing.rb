class Listing < ActiveRecord::Base
  belongs_to :region
  has_and_belongs_to_many :languages
  validates_formatting_of :link, using: :url
end
