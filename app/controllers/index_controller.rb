class IndexController < ApplicationController
  def index
    @addons = Addon.all
  end
end
