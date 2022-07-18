# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users::Registrations', type: :request do
  let(:user) { create(:user) }
  let(:user_params) { build(:user) }

  describe 'GET /users/sign_up' do
    it 'responds successfully' do
      get new_user_registration_path
      expect(response).to have_http_status 200
    end
  end

  describe 'POST /users/sign_up' do
    it 'リクエストが成功すること' do
      post user_registration_path, params: { user: user_params }
      expect(response.status).to eq 200
    end

    it 'ユーザーが登録されること' do
      expect do
        post user_registration_path, params: { user: attributes_for(:user) }
      end.to change(User, :count).by(1)
    end

    it 'リダイレクトすること' do
      post user_registration_path, params: { user: attributes_for(:user) }
      expect(response).to redirect_to root_path
    end
  end
end
