class FavoritesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = Micropost.find(params[:])
    current_user.favorites(@micropost)
    
  end


  def destroy

  end
end