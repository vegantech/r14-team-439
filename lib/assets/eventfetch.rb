
require 'pg'
require 'net/http'
require 'open-uri'
require 'json'

lastfetch = Time.new - 0.75
while true
  data = URI.parse('https://api.github.com/events?access_token=48453f7dca17e1523e77859ddf416f025b0a7919').read
  lastfetch = Time.new
  c = PG::Connection.open dbname: 'my_test_db'
  c.exec 'CREATE TABLE github_events ( id bigint, data json);'

  JSON.parse(data).each { |obj|
    id = obj['id']
    r = c.exec "SELECT * FROM github_events WHERE id=#{id};"
    unparsed = JSON.unparse(obj).gsub('\'', "\\\"")
    c.exec("INSERT INTO github_events VALUES (#{id}, '#{unparsed}');") unless r.count > 0
  }
  sleep(0.01) while (Time.new - lastfetch < 0.75)
end