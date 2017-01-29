class FavouritesController < ApplicationController
  before_action :set_image, only: [:create]
  before_action :set_favourite, only: [:destroy]
  
  def create
    @favourite = Favourite.new(user_id: current_user.id)
    @favourite.image_id = @image.id
    respond_to do |format|
      if @favourite.save
        format.js
      else
        format.html { render template: 'rate/index', alert: "Something's gone wrong" }
      end
    end
  end

  def destroy
    @favourite.destroy
    respond_to do |format|
      format.js
    end
  end
  
  private
  def set_image
    @image = Image.find(params[:id])
  end
  def set_favourite
    @favourite = Favourite.where(image_id: params[:id]).where(user_id: current_user.id).first
  end
end
