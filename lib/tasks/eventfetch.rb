
require 'pg'
require 'net/http'
require 'open-uri'
require 'json'

SILENT = false
DB = 'my_test_db'
TABLE = 'github_events'
puts "Opening connection to database '#{DB}'" unless SILENT
db = PG::Connection.open dbname: DB
if db.error_message.length > 0
  puts("Error connecting to database: #{db.error_message}", "ABORTING") unless SILENT
  abort
end
unless db.exec("SELECT * FROM pg_tables WHERE tablename='github_events';").count == 1
  puts "Creating table '#{TABLE}'"
  db.exec 'CREATE TABLE #{TABLE} ( id bigint, data json);'
end
unparsed = ''
while true
  lastfetch = Time.new
  puts "Time: #{lastfetch} - Requesting new data from Github API" unless SILENT
  data = URI.parse('https://api.github.com/events?access_token=48453f7dca17e1523e77859ddf416f025b0a7919').read
  if data.status[0] == "200"
    puts "     Data received OK, x-ratelimit-remaining is #{data.meta['x-ratelimit-remaining']}" unless SILENT
    newinserts = 0
    JSON.parse(data).each { |obj|
      id = obj['id']
      exists = db.exec("SELECT * FROM #{TABLE} WHERE id=#{id};").count > 0
      unless exists
        newinserts += 1
        db.exec("INSERT INTO #{TABLE} VALUES (#{id}, $QUOT$#{JSON.unparse(obj)}$QUOT$);")
      end
    }
    puts "     Added #{newinserts} new records into #{TABLE}" unless SILENT
  else
    puts "     Request returned with status #{data.status}", "     retrying" unless SILENT
  end
  sleep(0.01) while (Time.new - lastfetch < 0.75)
end