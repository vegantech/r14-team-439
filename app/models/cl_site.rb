class ClSite < ActiveRecord::Base
  SUFFIX = "/search/jjj/?excats=12-1-2-1-7-1-1-1-1-1-19-1-1-3-2-1-2-2-2-14-25-25-1-1-1-1-1-1"
  RSS_SUFFIX = "&format=rss"

  def link_url
    base_url + SUFFIX
  end

  def rss_url
    link_url + RSS_SUFFIX
  end
end
