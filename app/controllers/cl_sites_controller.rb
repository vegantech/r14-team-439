class ClSitesController < ApplicationController
  def index
    @cl_sites = ClSite.all
  end
end
