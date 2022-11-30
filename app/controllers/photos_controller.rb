class PhotosController < ApplicationController
  #before_action :logged_in_user, only[:create]
  
  def new
    @photo = current_user.photos.new
  end
  
  def create
    @photo = current_user.photos.new(photo_params)
    
    if @photo.save
      redirect_to :root
    else
      render :new
    end
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end 
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to home_url
  end
  
  private
  
  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end
