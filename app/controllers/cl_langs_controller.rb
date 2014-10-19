class ClLangsController < ApplicationController
  def index
    @rubysum = ClSite.sum(:ruby)
    @rubysites = ClSite.order(:ruby).where("ruby > 0")
  end
end
