# frozen_string_literal: true

class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.create(patient_id: params[:patient_id])
    if bookmark.save
      flash[:alert] = 'ブックマークしました'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'ブックマーク失敗です'
      render 'patients/show'
    end
  end

  def destroy
    bookmark = Bookmark.find_by(patient_id: params[:patient_id], user_id: current_user.id)
    if bookmark.destroy
      flash[:alert] = 'ブックマーク取り消しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'ブックマーク取り消し失敗です'
      render 'patients/show'
    end
  end
end
