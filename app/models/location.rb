class Location < ActiveRecord::Base
  belongs_to :region
  has_many :github_users
end
