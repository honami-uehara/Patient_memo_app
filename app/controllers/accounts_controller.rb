# frozen_string_literal: true

class AccountsController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if (params[:user][:password] == params[:user][:password_confirmation]) &&
       @user.update(params.require(:user).permit(:username, :email, :password))
      flash[:notice] = "#{@user.username}の情報を更新しました"
      redirect_to root_path(@user)
    else
      render :edit
    end
  end

  def bookmarks
    @user = current_user
    bookmarks = Bookmark.where(user_id: @user.id).pluck(:patient_registration_id)
    @bookmark_lists = PatientRegistration.find(bookmarks)
  end
end
