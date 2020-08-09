class ToppagesController < ApplicationController
  def index
    if logged_in?
      @today = Date.today
      @things = current_user.things
    end
  end
end
