class ToppagesController < ApplicationController
  def index
    if logged_in?
      @today = Date.today
      @things = current_user.things
      @motivation = Motivation.limit(1)
    end
  end
end
