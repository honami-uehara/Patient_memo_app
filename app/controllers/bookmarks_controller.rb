# frozen_string_literal: true

class BookmarksController < ApplicationController
  def create
    @bookmark = current_user.bookmarks.create(patient_id: params[:patient_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @bookmark = Bookmark.find_by(patient_id: params[:patient_id], user_id: current_user.id)
    @bookmark.destroy
    redirect_back(fallback_location: root_path)
  end
end
