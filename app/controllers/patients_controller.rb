# frozen_string_literal: true

class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q
  before_action :set_user
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @patient = Patient.new
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
    @bookmark = Bookmark.new
    @additional_comments = @patient.additional_comments
    @additional_comment = AdditionalComment.new
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      flash[:notice] = '患者情報を更新しました'
      redirect_to :patients
    else
      render 'edit'
    end
  end

  def destroy
    @patient.destroy
    flash[:notice] = '患者登録を削除'
    redirect_to :patients
  end

  def search
     @results= @q.result.order(created_at: :desc).page(params[:page]).per(5)
  end

  private

  def set_q
    @q = Patient.ransack(params[:q])
  end

  def patient_params
    params.require(:patient).permit(:name, :warn, :phone_number, :medical_record_number, :maintenance_or_treatment, :visit_date)
  end

  def set_user
    @user = current_user
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end
