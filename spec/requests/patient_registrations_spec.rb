require 'rails_helper'

RSpec.describe "PatientRegistrations", type: :request do
  let(:patient_registration) { create(patient_registration, user_id: user.id) }
  let(:user) { create(:user) }

  describe 'GET/index' do
    before do
      sign_in user
      get patient_registrations_path
    end

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it 'タイトルが表示されていること' do
      expect(response.body).to include "登録者一覧"
    end
  end

  describe 'GET/new' do
    before do
      sign_in user
    end
    it 'リクエストが成功すること' do
      get new_patient_registration_path
      expect(response.status).to eq 200
    end
  end


  describe 'GET/show' do
    let(:user) { create(:user) }
    let(:patient_registration) { create(:patient_registration, user_id: user.id) }

    before do
      sign_in user
      get patient_registration_path(patient_registration.id)
    end

    it 'リクエストが成功すること' do
       expect(response.status).to eq 200
    end

    it '名前が表示できること' do
      expect(response.body).to include patient_registration.name
    end

    it '電話番号が表示できること' do
      expect(response.body).to include patient_registration.phone_number
    end

    it '注意することが表示できること' do
      expect(response.body).to include patient_registration.warn
    end

    it '治療内容が表示できること' do
      expect(response.body).to include patient_registration.maintenance_or_treatment
    end

    it '来院日が表示できること' do
      expect(response.body).to include patient_registration.visit_date.to_s
    end
  end

  describe 'GET/edit' do
    let(:user) { create(:user) }
    let(:patient_registration) { create(:patient_registration, user_id: user.id) }

    before do
      sign_in user
      get edit_patient_registration_path(patient_registration.id)
    end

    it 'リクエストが成功すること' do
       expect(response.status).to eq 200
    end

    it '名前が表示できること' do
      expect(response.body).to include patient_registration.name
    end

    it '電話番号が表示できること' do
      expect(response.body).to include patient_registration.phone_number
    end

    it '注意することが表示できること' do
      expect(response.body).to include patient_registration.warn
    end

    it '治療内容が表示できること' do
      expect(response.body).to include patient_registration.maintenance_or_treatment
    end

    it '来院日が表示できること' do
      expect(response.body).to include patient_registration.visit_date.to_s
    end
  end

  describe 'POST/create' do
    context 'パラメーターが正常な場合' do
      let(:params) { { patient_registration: attributes_for(:patient_registration) } }

      before do
        sign_in user
      end

      it 'データーベースへの保存が成功すること' do
        expect do
          post patient_registrations_path(params)
        end.to change{ PatientRegistration.count }.by(1)
       end

      it 'リクエストが成功する' do
        post patient_registrations_path, params: params
        expect(response.status).to eq 302
      end
    end

    context 'パラメーターが異常な場合' do
      let(:invalid_params) { { patient_registration: attributes_for(:patient_registration, :invalid) } }

      it 'データーベースが保存されない' do
        expect do
          post patient_registrations_path, params: invalid_params
        end.not_to change{ PatientRegistration.count }
      end
    end

    describe 'POST/destory' do

      before do
        sign_in user
      end

      let!(:patient_registration2) { create(:patient_registration) }

      it '削除されること' do
       expect do
         delete patient_registration_path(patient_registration2)
       end.to change{ PatientRegistration.count }.by(-1)
     end
    end
  end

  describe '非ログイン' do
    context
    it 'ログインページにリダイレクトされること' do
      get patient_registrations_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'PATCH/update' do

    before do
      sign_in user
    end

    let!(:params) { { patient_registration: attributes_for(:patient_registration, name: 'test1') } }
    let!(:patient_registration) { create(:patient_registration) }


    it 'リクエストが成功する' do
      post patient_registrations_path, params: params
      expect(response.status).to eq 302
    end

    it "データが更新されること" do
      expect(patient_registration.reload.name).to eq 'MyString'
    end
  end
end
