class HomesController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]
  
  def index
    @homes = Home.all
  end
  
  def new
    @homes =  Home.new
  end
  
  def create
    @homes = Home.create(home_params)
    if @homes.save
      redirect_to :homes_path
    else
      render :new
    end
  end
  
  
  def edit
    @homes = Home.find(params[:id])
  end 
  
  def destroy
    @homes = Home.find(params[:id])
    @homes.destroy
    redirect_to home_url
  end
  
  private
  
  def home_params
    params.require(:home).permit(:caption, :image)
  end
end



