
require 'pg'
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

r = db.exec("SELECT * FROM #{TABLE} WHERE data->>'type'='PushEvent' ORDER BY id ASC;")
r.each do |row|
  data = JSON.parse(row['data'])
  push_id = data['payload']['push_id']

  next if GithubPushEvent.where(id: [push_id])[0].present?
  puts "push_id #{push_id}"
  repo_user, repo_name =  *(data['repo']['name'].split('/', 2)
  repo_id = data['repo']['id']
  push_time = data['created_at']
  push_actor = data['actor']['login']
  push_actor_idnumber = data['actor']['id'])
  GithubPushEvent.new( id: push_id, github_repo_id: repo_id, github_user_id: repo_user, event_time: push_time ).save!
  
  existing = GithubRepo.where( id: [repo_id] )[0]
  if existing.blank?
    GithubRepo.new( id: repo_id, github_user_id: repo_user, name: repo_name ).save!
  else
    existing.update( github_user_id: repo_user, name: repo_name )
  end
  GithubUser.new( id: push_actor, idnumber: push_actor_idnumber).save! unless GithubUser.where( id: [push_actor] ).present?
  data['payload']['commits'].each {|commit| GithubCommit.new(github_push_event_id: push_id, commit_sha: commit['sha']).save!}

end