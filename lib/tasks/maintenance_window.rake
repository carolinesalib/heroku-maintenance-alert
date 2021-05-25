desc "Reads maintenance windows from Heroku cli and updates the database"
task check_maintenance_window: :environment do
  heroku_apps = ENV['HEROKU_APPS']

  if heroku_apps.nil?
    raise 'No HEROKU_APPS configured'
  end

  heroku_apps.split(',').each do |heroku_app|
    maintenance_data_list = JSON.parse(`heroku data:maintenances --app #{heroku_app} --json`)

    maintenance_data_list.each do |maintenance_data|
      p maintenance_data
      heroku_app = HerokuApp.find_or_create_by!(
        name: maintenance_data['app']['name'],
        uuid: maintenance_data['app']['uuid'],
      )

      Addon.find_or_create_by!(
        name: maintenance_data['addon']['name'],
        uuid: maintenance_data['addon']['uuid'],
      ) do |addon|
        addon.heroku_app = heroku_app
        addon.plan = maintenance_data['addon']['plan']
        addon.window = maintenance_data['addon']['window']
      end
    end
  end
end
