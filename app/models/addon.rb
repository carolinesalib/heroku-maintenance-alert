class Addon < ApplicationRecord
  belongs_to :heroku_app

  after_create_commit { broadcast_prepend_to 'addons' }
  after_update_commit { broadcast_replace_to 'addons' }
  after_destroy_commit { broadcast_remove_to 'addons' }
end
