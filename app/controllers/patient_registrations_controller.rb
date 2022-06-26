class PatientRegistrationsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_q

  def index
    @user = current_user
    @patient_registrations = PatientRegistration.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @patient_registration = PatientRegistration.new
    @user = current_user
  end

  def create
    @patient_registration = PatientRegistration.new(params.require(:patient_registration).permit(:name, :warn, :phone_number, :medical_record_number, :maintenance_or_treatment, :visit_date))
    @patient_registration.user_id = current_user.id
    if @patient_registration.save
      redirect_to :patient_registrations
      flash[:notice] = "登録が完了しました"
    else
      render "new"
    end
  end

 def show
    @user = current_user
    @patient_registration = PatientRegistration.find(params[:id])
    @bookmark = Bookmark.new
    @additional_comments = @patient_registration.additional_comments
    @additional_comment = AdditionalComment.new
  end

  def edit
    @user = current_user
    @patient_registration = PatientRegistration.find(params[:id])
  end

  def update
    @patient_registration = PatientRegistration.find(params[:id])
    if @patient_registration = PatientRegistration.update(params.require(:patient_registration).permit(:name, :warn, :phone_number, :medical_record_number, :maintenance_or_treatment, :visit_date))
      flash[:notice] = "患者情報を更新しました"
      redirect_to :patient_registrations
    else
      render "edit"
    end
  end

  def destroy
    @patient_registration = PatientRegistration.find(params[:id])
    @patient_registration.destroy
    flash[:notice] = "患者登録を削除"
    redirect_to :patient_registrations
  end

  def search
    @user = current_user
    @results = @q.result.order(created_at: :desc).page(params[:page]).per(5)
  end

  private

  def set_q
    @q = PatientRegistration.ransack(params[:q])
  end
end
