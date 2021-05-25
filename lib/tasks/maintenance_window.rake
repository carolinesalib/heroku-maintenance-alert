desc "Reads maintenance windows from Heroku cli and updates the database"
task :check_maintenance_window do
  heroku_apps = ENV['HEROKU_APPS']

  if heroku_apps.nil?
    raise 'No HEROKU_APPS configured'
  end

  heroku_apps.split(',').each do |heroku_app|
    maintenance_data = JSON.parse(`heroku data:maintenances --app #{heroku_app} --json`)
    p maintenance_data
  end

# TODO: how to save this data?
#{
  #"addon"=>{
    #"uuid"=>"d0df48ae-9135-479e-b9cd-3e724df5ba20",
    #"name"=>"atvenu-vfaserver-staging-database-20210228",
    #"attachments"=>[
      #"DATABASE_FOLLOWER_2021_URL",
      #"DATABASE_URL"
    #],
    #"kind"=>"heroku-postgresql",
    #"plan"=>"standard-0",
    #"window"=>"Tuesdays 16:00 to 20:00 UTC"
  #},
  #"app"=>{
    #"name"=>"atvenu-vfaserver-staging",
    #"uuid"=>"0158de69-2866-4183-a387-d83919204ce3"
  #},
  #"window"=>nil,
  #"status"=>"none",
  #"required_by"=>nil,
  #"scheduled_for"=>nil,
  #"method"=>nil,
  #"addon_description"=>nil,
  #"started_at"=>nil,
  #"completed_at"=>nil,
  #"duration_seconds"=>nil,
  #"reason"=>nil,
  #"server_created_at"=>nil
#}
end
