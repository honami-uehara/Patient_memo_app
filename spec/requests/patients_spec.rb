# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Patients', type: :request do
  let(:patient) { create(patient, user_id: user.id) }
  let(:user) { create(:user) }

  describe 'GET/index' do
    before do
      sign_in user
      get patients_path
    end

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it 'タイトルが表示されていること' do
      expect(response.body).to include '登録者一覧'
    end
  end

  describe 'GET/new' do
    before do
      sign_in user
    end
    it 'リクエストが成功すること' do
      get new_patient_path
      expect(response.status).to eq 200
    end
  end

  describe 'GET/show' do
    let(:user) { create(:user) }
    let(:patient) { create(:patient, user_id: user.id) }

    before do
      sign_in user
      get patient_path(patient.id)
    end

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it '名前が表示できること' do
      expect(response.body).to include patient.name
    end

    it '電話番号が表示できること' do
      expect(response.body).to include patient.phone_number
    end

    it '注意することが表示できること' do
      expect(response.body).to include patient.warn
    end

    it '治療内容が表示できること' do
      expect(response.body).to include patient.maintenance_or_treatment
    end

    it '来院日が表示できること' do
      expect(response.body).to include patient.visit_date.to_s
    end
  end

  describe 'GET/edit' do
    let(:user) { create(:user) }
    let(:patient) { create(:patient, user_id: user.id) }

    before do
      sign_in user
      get edit_patient_path(patient.id)
    end

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it '名前が表示できること' do
      expect(response.body).to include patient.name
    end

    it '電話番号が表示できること' do
      expect(response.body).to include patient.phone_number
    end

    it '注意することが表示できること' do
      expect(response.body).to include patient.warn
    end

    it '治療内容が表示できること' do
      expect(response.body).to include patient.maintenance_or_treatment
    end

    it '来院日が表示できること' do
      expect(response.body).to include patient.visit_date.to_s
    end
  end

  describe 'POST/create' do
    context 'パラメーターが正常な場合' do
      let(:params) { { patient: attributes_for(:patient) } }

      before do
        sign_in user
      end

      it 'データーベースへの保存が成功すること' do
        expect do
          post patients_path(params)
        end.to change { Patient.count }.by(1)
      end

      it 'リクエストが成功する' do
        post patients_path, params: params
        expect(response.status).to eq 302
      end
    end

    describe 'POST/destory' do
      before do
        sign_in user
      end

      let!(:patient2) { create(:patient, user: user) }

      it '削除されること' do
        expect do
          delete patient_path(patient2)
        end.to change { Patient.count }.by(-1)
      end
    end
  end

  describe '非ログイン' do
    context
    it 'ログインページにリダイレクトされること' do
      get patients_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'PATCH/update' do
    before do
      sign_in user
    end

    let!(:params) { { patient: attributes_for(:patient, name: 'test1') } }
    let!(:patient) { create(:patient, user: user) }

    it 'リクエストが成功する' do
      post patients_path, params: params
      expect(response.status).to eq 302
    end

    it 'データが更新されること' do
      expect(patient.reload.name).to eq 'MyString'
    end
  end
end
