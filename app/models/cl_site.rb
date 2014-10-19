class ClSite < ActiveRecord::Base
  SUFFIX = "/search/jjj/?excats=12-1-2-1-7-1-1-1-1-1-19-1-1-3-2-1-2-2-2-14-25-25-1-1-1-1-1-1"
  RSS_SUFFIX = "&format=rss"

  def link_url
    base_url + SUFFIX
  end

  def rss_url
    link_url + RSS_SUFFIX
  end

  #this may go away
  def local_rss
    "file:///" + Rails.root.join("data","cl-rss", base_url.split("//").last + ".rss").to_s
  end

  #refactor this and move it elsewhere
  def parse_feed url=rss_url

    f = Feedjira::Feed.fetch_and_parse url, {if_modified_since: last_fetched || 2.weeks.ago}
    puts f.inspect
    if f.last_modified.blank?
      save_and_update_last_fetched if self.last_fetched.blank?
      return
    end
    if last_fetched.blank? || f.last_modified > last_fetched
      f.entries.each do |entry|
        if last_fetched.blank? || last_fetched < entry.published
          self.total_entries += 1
          #parse title and summary
          self.no_matches += 1
        end
      end
      save_and_update_last_fetched
    end
  end

  def parse_local_feed
    parse_feed local_rss
  end


  def save_and_update_last_fetched
    self.last_fetched = Time.now
    save
  end
end
