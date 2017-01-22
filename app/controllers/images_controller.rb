class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :rate]


  #get info about object from particular category
  def show

  end

  def rate
    #@image = Image.find(params['id'])
    @image.ave_value = @image.values.average(:value)
    respond_to do |format|
      if @image.save
        flash.now[:notice] = 'Rate was successfully created'
        format.json { render json: @image, notice: 'Rate was successfully created', location: @image }
      else
        format.html { render rate_path, alert: 'Something has gone wrong or you have already shared your rate for this title.' }
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
