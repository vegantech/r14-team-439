module ClUpdater
  PER_RUN=10
  def self.go
      ClSite.order(:last_fetched).limit(PER_RUN).each do |site|
        begin
         site.parse_feed 
        rescue Timeout::Error, Exception
        end
        sleep 1
    end
  end

end
