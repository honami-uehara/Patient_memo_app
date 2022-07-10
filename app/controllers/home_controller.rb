# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :set_q

  def top
    @user = current_user
  end

  def about
    @user = current_user
  end

  def search
    @user = current_user
    @results = @q.result.order(created_at: :desc).page(params[:page]).per(5)
  end

  private

  def set_q
    @q = Patient.ransack(params[:q])
  end
end
