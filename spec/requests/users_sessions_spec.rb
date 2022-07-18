# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users::Sessions', type: :request do
  let(:user) { create(:user, password: 'test1111', password_confirmation: 'test1111') }

  describe 'GET /users/sign_in' do
    it 'responds successfully' do
      get new_user_session_path
      expect(response).to have_http_status 200
    end

    it 'トップページにリダイレクトされること' do
      get root_path
      expect(response.status).to eq 302
    end
  end

  describe 'POST /users/sign_in' do
    it 'ログインできること' do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      expect(response).to have_http_status 302
      expect(response).to redirect_to root_path
    end

    context 'パスワードが間違っている場合' do
      it 'ログインできない' do
        post user_session_path, params: { user: { email: user.email, password: 'test3333' } }
        expect(response).not_to redirect_to root_path
        expect(flash.alert).to eq 'Eメールまたはパスワードが違います。'
      end
    end
  end
end
