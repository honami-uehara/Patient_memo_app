class HomeController < ApplicationController
  before_action :set_q

  def top
    @user = current_user
  end

  def about
  end

  def search
    @results = @q.result.order(created_at: :desc).page(params[:page]).per(5)
  end

  private

  def set_q
    @q = PatientRegistration.ransack(params[:q])
  end
end
