class ClSite < ActiveRecord::Base
  require 'language_recognizer'
  
  scope :with_content,  -> {where("total_entries > 0 and total_entries - no_matches > 0")}
  
  SUFFIX = "/search/jjj/?excats=12-1-2-1-7-1-1-1-1-1-19-1-1-3-2-1-2-2-2-14-25-25-1-1-1-1-1-1"
  RSS_SUFFIX = "&format=rss"
  LANGS = LanguageRecognizer::LANG_LIST.collect{|e| e[:abbrev]}

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



  def content_columns
    attributes.slice(*LANGS).select{|k,v| v>0}.sort_by{|k,v| v}
  end


  #refactor this and move it elsewhere
  def parse_feed url=rss_url, now = Time.now

    options = {
        user_agent: 'Geolinguist Test',
        max_redirects: 2,
        compress: true
    }


    f = Feedjira::Feed.fetch_and_parse url, options
    if f.url != rss_url.sub(RSS_SUFFIX,'')
      self.base_url = f.url.sub(RSS_SUFFIX,'').sub(SUFFIX,'')
      url = rss_url
      save
      f = Feedjira::Feed.fetch_and_parse url, options
    end


    if f.last_modified.blank?
      save_and_update_last_fetched now if self.last_fetched.blank?
      return
    end
    if last_fetched.blank? || f.last_modified > last_fetched
      puts f.inspect
      f.entries.each do |entry|
        if last_fetched.blank? || last_fetched < entry.published
          self.total_entries += 1
          body = [entry.title,entry.summary].join("\n")
          matches = LanguageRecognizer.recognize body
          if matches.blank?
            self.no_matches += 1
          else
            matches.each {|match| self[match] += 1}
          end
        end
      end
      save_and_update_last_fetched now
    end
  end

  def parse_local_feed
    parse_feed local_rss, 2.days.ago
  end


  def save_and_update_last_fetched now
    self.last_fetched = now
    save
  end
end
