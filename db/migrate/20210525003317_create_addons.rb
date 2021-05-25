class CreateAddons < ActiveRecord::Migration[7.0]
  def change
    create_table :addons do |t|
      t.string :name
      t.uuid :uuid
      t.string :kind
      t.string :plan
      t.timestamp :window
      t.references :heroku_app, null: false, foreign_key: true

      t.index :uuid, unique: true

      t.timestamps
    end
  end
end
