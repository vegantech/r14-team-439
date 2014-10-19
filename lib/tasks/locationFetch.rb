

CITYRESOLVER = {

  ["vancouver","vancouver,bc","vancouver,britishcolumbia", "vancouver,can", "vancouver,canada"] => "Vancouver, BC",

  ["toronto","toronto,on","toronto,can","toronto,canada"] => "Toronto, ON",

  ["portland,or","portland,oregon","stumptown","bridgetown","pdx"] => "Portland, OR",

  ["sanfrancisco","sanfran","SFbay","siliconvalley", "sanfrancisco,ca", "sanfrancisco,california"] => "San Francisco, CA",

  ["chicago","chicago,il","chicago,illinois"] => "Chicago, IL",

  ["memphis","memphis,tn","memphis,tennessee"] => "Memphis, TN",

  ["newyork","newyorkcity","nyc","brooklyn","nyny","ny,ny","bronx","queens","manhatten","newyork,ny"] => "New York City, NY",

  ["la","losangeles","la,ca","losangeles,california","losangeles,ca"] => "Los Angeles, CA",

  ["seattle","seattle,wa","seattle,washington"] => "Seattle, WA",

  ["austin","austin,tx","austin,texas"] => "Austin, TX",

  ["dallas","dallas,tx","dallas,texas"] => "Dallas, TX",

  ["pittsburgh", "pittsburgh,pa", "pittsburgh,pennsylvania"] => "Pittsburgh, PA",

  ["philly","philly,pa","philadelphia","philadelphia,pa","philadelphia,pennsylvania"] => "Philadelphia, PA",

  ["atlanta","atl","atlanta,ga","atlanta,georgia"] => "Atlanta, GA",

  ["detroit","detroit,mi", "detroit,michigan"] => "Detroit, MI",

  ["montreal","montreal,qc","montreal,quebec","montreal,can","montreal,canada"] => "Montreal, QC"

}

github = Github.new oauth_token: "48453f7dca17e1523e77859ddf416f025b0a7919"
remaining_requests = 5000
GithubUser.where("location_id is null").each do |user|
  if remaining_requests > 0
    user_name = nil
    location_id = nil
    location_name = ''
    response = github.users.get user: user.id
    remaining_requests = response.headers.ratelimit_remaining.to_i
    user_name = response.name if response.has_key? 'name'
    location_name = response.location if response.has_key? 'location' and response.location.present?
    puts "location name: #{location_name}\n\nuser: #{user}"
    CITYRESOLVER.keys.each {|key| location_name = CITYRESOLVER[key] if key.include? location_name.downcase.gsub(/\s/, '')}
    search = Location.where name: location_name
    if search.present?
      user.update location_id: search[0].id
    else
      newloc = Location.new name: location_name
      newloc.save!
      user.update location_id: newloc.id
    end
  else
    sleep 1
  end
end
