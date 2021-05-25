class CreateHerokuApps < ActiveRecord::Migration[7.0]
  def change
    create_table :heroku_apps do |t|
      t.string :name
      t.uuid :uuid

      t.index :uuid, unique: true

      t.timestamps
    end
  end
end
