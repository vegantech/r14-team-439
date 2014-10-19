class ClSitesController < ApplicationController
  def index
    @cl_sites = ClSite.with_content
  end
end
