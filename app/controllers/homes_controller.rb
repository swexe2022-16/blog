class HomesController < ApplicationController
  #before_action :logged_in_user, only:[:edit, :update, :destroy]
  
  def index
    @homes = Home.all
  end
  
  def new
    @homes =  Home.new
  end
  
  def create
    @homes = Home.new(home_params)#create    if @homes.save
    if @homes.save!
      redirect_to homes_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @homes = Home.find(params[:id])
  end 
  
  def update
    @homes = Home.find(params[:id])
    @homes.update(home_params)
    redirect_to homes_path
  end
  
  def destroy
    @homes = Home.find(params[:id])
    @homes.destroy
    redirect_to homes_path
  end
  
  private
  
  def home_params
    params.require(:home).permit(:caption, :image)
  end

end