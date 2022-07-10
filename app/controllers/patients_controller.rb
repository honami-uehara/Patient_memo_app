# frozen_string_literal: true

class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q

  def index
    @user = current_user
    @patients = Patient.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @patient = Patient.new
    @user = current_user
  end

  def create
    @patient = Patient.new(params.require(:patient).permit(:name, :warn, :phone_number, :medical_record_number, :maintenance_or_treatment, :visit_date))
    @patient.user_id = current_user.id
    if @patient.save
      redirect_to :patients
      flash[:notice] = '登録が完了しました'
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @patient = Patient.find(params[:id])
    @bookmark = Bookmark.new
    @additional_comments = @patient.additional_comments
    @additional_comment = AdditionalComment.new
  end

  def edit
    @user = current_user
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if Patient.update(params.require(:patient).permit(:name, :warn, :phone_number, :medical_record_number, :maintenance_or_treatment, :visit_date))
      flash[:notice] = '患者情報を更新しました'
      redirect_to :patients
    else
      render 'edit'
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    flash[:notice] = '患者登録を削除'
    redirect_to :patients
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
