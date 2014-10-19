class ClLangsController < ApplicationController
  def index
    @rubysum = ClSite.sum(:ruby)
    @rubysites = ClSite.order('ruby desc').where("ruby > 0")
  end
end
