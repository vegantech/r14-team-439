require 'nokogiri'
require 'csv'

regions = []

doc = Nokogiri::HTML open("cl_regions.html");nil
CSV.open('cl_sites.csv',"w") do |csv|

  doc.css('h1').each do |region|
    region.next_element.css('h4').each do |subregion|
      subregion.next_element.css('a').each do |site|
        csv << [region.inner_text, subregion.inner_text, site.inner_text, site['href']]
      end
    end
  end
end
