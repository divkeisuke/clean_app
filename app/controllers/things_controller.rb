class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in, only: [:user_things,:show,:new,:edit]


  def index
    @place = current_user.places.find(params[:place_id])
    @things = current_user.places.find(params[:place_id]).things
  end
  
  def user_things
    @things = current_user.things
  end


  def show
    @place = current_user.places.find(params[:place_id])
    @today = Date.today
    @clean_limit = @thing.clean_day + @thing.clean_frequency - @today
    @clean_progress_day = @today - @thing.clean_day
  end


  def new
    @place = current_user.places.find(params[:place_id])
    @thing = current_user.places.find(params[:place_id]).things.build
    @today = Date.today
  end


  def edit
    @place = current_user.places.find(params[:place_id])
    @today = Date.today
  end


  def create
    @thing = current_user.places.find(params[:place_id]).things.build(thing_params)
    @thing.user_id = current_user.id
    @place = current_user.places.find(params[:place_id])
    if @thing.save
      flash[:success] = "#{@thing.name}を追加しました。"
      redirect_to place_things_path
    else
      flash.now[:danger] = "#{@thing.name}の追加に失敗しました。"
      render "new"
    end
  end


  def update
    if @thing.update(thing_params)
      flash[:success] = "#{@thing.name}を編集しました"
      redirect_to place_things_path
    else
      flash.now[:danger] = "#{@thing.name}を編集できませんでした"
      render :edit
    end
  end


  def destroy
    @thing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thing
      @thing = current_user.places.find(params[:place_id]).things.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def thing_params
      params.require(:thing).permit(:user_id,:place_id, :name, :clean_day, :clean_frequency, :remarks, :tool1, :tool2, :tool3, :tool4, :tool5, :image)
    end
end
