# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    if (params[:user][:password] == params[:user][:password_confirmation]) &&
       @user.update(account_params)
      flash[:notice] = "#{@user.username}の情報を更新しました"
      redirect_to root_path(@user)
    else
      render :edit
    end
  end

  def bookmarks
    bookmarks = Bookmark.where(user_id: @user.id).pluck(:patient_id)
    @bookmark_lists = Patient.find(bookmarks)
    @patients = Patient.order(created_at: :desc).page(params[:page]).per(5)
  end

  private

  def account_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = current_user
  end
end
