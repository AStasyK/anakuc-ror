class RateController < ApplicationController
  def index
    @categories = Category.all
    #@images = Image.all
  end

  #current action
  def from_category
    @selected = Category.find(params[:id]).images
    respond_to do |format|
      format.js
    end
  end

  def show_info
    @image = Image.find(params[:id])
    category_name = @image.category.name.downcase.singularize.to_sym  # -> :game or :platform
    @object = @image.send(category_name)  # -> called @image.game or @image.platform  -> got specific book or platform
    @favourite = Favourite.where(image_id: @image.id).where(user_id: current_user.id)
    respond_to do |format|
      format.js
    end
  end
end
