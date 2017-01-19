class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :rate]


  # GET /images/1
  # GET /images/1.json
  def show
    category_name = @image.category.name.downcase.singularize.to_sym

    @object = @image.send(category_name)

    respond_to do |format|
      format.js { RateController.render 'rate/show_info.js.erb', locals: { object: @object } }
    end
  end

  def rate
    #@image = Image.find(params['id'])
    @image.ave_value = (@image.values.sum :value) / (@image.values.count)
    respond_to do |format|
      if @image.save
        format.html { redirect_to rate_path, notice: 'Rate was successfully created.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

end
