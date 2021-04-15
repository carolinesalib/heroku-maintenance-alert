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
end
