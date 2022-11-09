class HomesController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]
  
  def index
    @homes = Home.all
  end
  
  def new
      @home = Home.new
  end
end
