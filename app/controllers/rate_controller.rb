class RateController < ApplicationController
  def index
    @categories = Category.all
    @images = Image.all
  end

  def select
    @images = Category.find(params[:id]).images
    respond_to do |format|
      format.json { render json: @images }
    end
  end

  def from_category
    @selected = Category.find(params[:id]).images
    respond_to do |format|
      format.js
    end
  end
end
