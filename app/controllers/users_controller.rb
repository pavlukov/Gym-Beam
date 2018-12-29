class UsersController < ApplicationController

  # GET users/unapproved
  def unapproved_list
    authorize current_user
    @users = User.where(approved: false)
  end

  # POST users/confirm
  def confirm
    authorize current_user
    user = User.find(params[:id])
    user.approved = true
    respond_to do |format|
      if user.save
        format.html { redirect_to users_unapproved_path, notice: 'User confirmed.' }
      else
        format.html { render :unapproved }
      end
    end
  end

  # DELETE users/reject
  def reject
    authorize current_user
    user = User.find(params[:id])
    user.destroy
    respond_to do |format|
      format.html { redirect_to users_unapproved_path, notice: 'User rejected.' }
    end
  end
end
