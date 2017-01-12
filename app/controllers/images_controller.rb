class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :rate, :destroy]


  # GET /images/1
  # GET /images/1.json
  def show
    category_name = @image.category.name.downcase.singularize.to_sym
    to_exclude = ['id', 'image_id', 'category_id', 'created_at', 'updated_at']
    @obj_attr = @image.send(category_name).attributes
    @obj_attr.reject! { |key, value| to_exclude.include? key }
    respond_to do |format|
      format.html { redirect_to rate_path }
      format.json { render json: @obj_attr }
    end
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def rate
    #@image = Image.find(params['id'])
    @image.ave_value = @image.values.average :value
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

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

end
