class FavoritesController < ApplicationController
  before_action :logged_in_user, only: [:update]

  def update
    @micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(@micropost)
    if request.xhr?
      head :ok
    else
      render 'static_pages/home'
    end  
  end

  private
end
