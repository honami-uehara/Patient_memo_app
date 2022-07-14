# frozen_string_literal: true

class AdditionalCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @patient = Patient.find(params[:patient_id])
    @additional_comment = current_user.additional_comments.new(additional_comment_params)

    if @additional_comment.save
      flash[:notice] = '追加コメントしました'
      redirect_to [@patient]
    else
      flash[:notice] = '投稿失敗です'
      render 'patients/show'
    end
  end

  def destroy
    additional_comment = current_user.additional_comments.find(params[:id])
    additional_comment.destroy
    redirect_to [:patient, { id: params[:patient_id] }]
  end

  private

  def additional_comment_params
    params.require(:additional_comment).permit(:content, :posted_date).merge(patient_id: params[:patient_id])
  end
end
