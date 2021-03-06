class UsersController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @rates = Value.group(:user_id).count(:value)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #@relations = Relationship.where("follower_id = ? OR followed_id = ?", @user.id, @user.id)
    followeds_rel = Relationship.where('follower_id = ?', @user.id).pluck(:followed_id)
    @followeds = User.where(id: followeds_rel)
    followers_rel = Relationship.where('followed_id = ?', @user.id).pluck(:follower_id)
    @followers = User.where(id: followers_rel)
    @followers_sample = @followers.count > 5 ? @followers.sample(5) : @followers
    @followeds_sample = @followeds.count > 5 ? @followeds.sample(5) : @followeds

    favourites = Favourite.where(user_id: current_user.id).pluck(:image_id)
    @images = Image.joins(:category).find(favourites)
    @objects = Array.new
    @categories = Array.new
    @images.each do |image|
      image_category = image.category
      @categories << {id: image_category.id, name: image_category.name}
      method = image_category.name.downcase.singularize.to_sym
      object = image.send(method)
      @objects << object
    end
    @categories.uniq! {|object| object[:id] }
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in @user
        flash.now[:notice] = 'Welcome!'
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        flash.now[:alert] = 'Something went wrong during registration process'
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end