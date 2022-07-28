# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :set_q
  before_action :set_user

  def top
  end

  def about
  end

  def search
    @results = @q.result.order(created_at: :desc).page(params[:page]).per(5)
  end

  private

  def set_q
    @q = Patient.ransack(params[:q])
  end

  def set_user
    @user = current_user
  end
end
