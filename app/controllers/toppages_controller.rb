class ToppagesController < ApplicationController
  def index
    if logged_in?
      @today = Date.today
      @things = current_user.things
      rand = Rails.env.production? ? "RANDOM()" : "rand()"
      @motivation = Motivation.order(rand).limit(1)
    end
  end
end
