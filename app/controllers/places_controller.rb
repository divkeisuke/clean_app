class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy]
  before_action :require_user_logged_in, only: [:index,:show,:edit]


  def index
    @places = current_user.places.order(id: :desc)
    @place = current_user.places.build
  end


  def show
    @things = current_user.places.find(params[:id]).things
  end


  def new
    @place = Place.new
  end


  def edit
  end


  def create
    @place = current_user.places.build(place_params)
    if @place.save
      flash[:success] = "#{@place.name}を追加しました。"
      redirect_to places_url
    else
      @places = current_user.places.order(id: :desc)
      flash.now[:danger] = "#{@place.name}の追加に失敗しました。"
      render 'places/index'
    end
  end


  def update

    if @place.update(place_params)
      flash[:success] = "#{@place.name}の名称を変更しました"
      redirect_to places_path
    else
      flash.now[:danger] = "#{@place.name}の名称は変更されませんでした"
      render :edit
    end
  end


  def destroy
    @place.destroy
  end

  private
  
  def correct_user
    @place = current_user.places.find_by(id: params[:id])
    unless @place
      redirect_to root_url
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = current_user.places.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_params
      params.require(:place).permit(:user_id,:place_id,:name)
    end
    
end
