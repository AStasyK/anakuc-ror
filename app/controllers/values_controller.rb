class ValuesController < ApplicationController
  before_action :set_value, only: [:show]

  # GET /values
  # GET /values.json
  def index
    @values = Value.all
  end

  # GET /values/1
  # GET /values/1.json
  def show
  end

  # GET /values/new
  def new
    @value = Value.new
  end

  # GET /values/1/edit
  def edit
  end

  # POST /values
  # POST /values.json
  def create
    @parameters = params[:values]
    @value = Value.new(user_id: current_user.id)
    @value.value = params[:values][:value]
    @value.image_id = params[:values][:image_id]
    @image = Image.find(@value.image_id)
    respond_to do |format|
      if @value.save
        format.html { redirect_to "/images/#{@image.id}/rate"}
        format.json { redirect_to render :show, status: :created, location: @value }
      else
        format.html { render :new, @value.errors }
        format.json { render json: @value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /values/1
  # PATCH/PUT /values/1.json


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_value
      @value = Value.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

end
