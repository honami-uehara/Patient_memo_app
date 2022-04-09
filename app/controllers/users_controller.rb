class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:username, :email, :password))
      flash[:notice] = "#{@user.username}の情報を更新しました"
      redirect_to  root_path(@user)
    else
      render "edit"
    end
  end
end
