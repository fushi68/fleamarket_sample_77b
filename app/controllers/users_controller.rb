class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :comment).merge(without_validate: true)
  end
end

