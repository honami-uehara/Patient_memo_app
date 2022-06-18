require 'rails_helper'

RSpec.describe "AdditionalComments", type: :request do
  let(:user) { create(:user) }
  let(:patient_registration_record) { create(:patient_registration) }


  before do
    sign_in user
  end

  describe 'Patient_registration/additionalcomment/create' do
    it 'responds successfully' do
      post patient_registration_additional_comments_path(patient_registration_record.id)
      expect(response.status).to eq 302
    end
  end
end

