class RateController < ApplicationController
  def index
    @categories = Category.all
  end

  def select
    @images = Category.find(params[:id]).images.pluck(:file)
    respond_to do |format|
      format.json { render json: @images }
    end
  end
end
