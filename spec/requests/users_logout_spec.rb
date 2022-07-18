# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ログアウト', type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ログアウトができること' do
    delete destroy_user_session_path(@user)
    expect(response).to have_http_status(204)
  end
end
