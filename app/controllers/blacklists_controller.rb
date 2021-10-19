class BlacklistsController < ApplicationController
  def index
    render plain: 'You are blacklisted'
  end
end
