require 'rails_helper'

RSpec.describe "AdditionalComments", type: :request do
  let(:user) { create(:user) }
  let(:patient_registration_record) { create(:patient_registration) }
  let!(:params_2) { { patient_registration: attributes_for(:patient_registration) } }


  before do
    sign_in user
  end

  describe 'Patient_registration/additionalcomment/create' do

    it 'responds successfully' do
      post patient_registration_additional_comments_path, params: params_2
      expect(response.status).to eq 302
    end
  end

  it 'データーベースへの保存が成功すること' do
    expect do
      post patient_registration_additional_comments_path(params_2)
    end.to change{ AdditionalComment.count }.by(1)
  end

  describe 'additionalcomment/destory' do
    let!(:additional_comment) { create(:additional_comment, patient_registration: patient_registration_record, user: user) }

    before do
      sign_in user
    end

    it '削除されること' do
     expect do
       delete  patient_registration_additional_comment_path( patient_registration_record.id, additional_comment.id)
     end.to change{ AdditionalComment.count }.by(-1)
   end
  end
end

