# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users::Registrations', type: :request do

  before do
    @user = FactoryBot.create(:user)
  end

  describe 'GET /users/sign_in' do
    it 'responds successfully' do
      get new_user_registration_path
      expect(response).to have_http_status 200
    end
  end

  it 'トップページにリダイレクトされること' do
    get root_path
    expect(response.status).to eq 302
  end
end
