class HomesController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]
  
  def index
    @homes = Home.all
  end
  
  def new
      @home = Home.new
  end
  
  def create
    @home = Home.create(home_params)
    redirect_to homes_path
  end
  
  def edit
    @home = Home.find(params[:id])
  end 
  
  def update
    @home = Home.find(params[:id])
    @home.update(home_params)
    redirect_to homes_path
  end
  
  def destroy
    @home = Home.find(params[:id])
    @home.destroy
    redirect_to home_url
  end
    
  private
    def home_params
      params.require(:home).permit(:title)
    end
end
