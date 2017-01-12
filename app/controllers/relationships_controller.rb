class RelationshipsController < ApplicationController
  def follow
    @relationship = Relationship.new
    @user = User.find(params[:id])
    @relationship.followed_id = @user.id
    @relationship.follower_id = current_user.id
    respond_to do |format|
      if @relationship.save
        format.html { redirect_to user_path(@user), notice: 'You have followed the user.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @relationship.errors, notice: 'Fail' }
        format.json { head :no_content }
      end
    end
  end
  def destroy
    @relationship = Relationship.find(params[:id])
    @user = User.find(@relationship.followed_id)
    @relationship.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@user), notice: 'You have undollowed the user.' }
      format.json { head :no_content }
    end
  end
end