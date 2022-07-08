# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Bookmarks', type: :request do
  let(:user) { create(:user) }
  let(:patient_registration_record) { create(:patient_registration) }

  before do
    sign_in user
  end

  describe 'Patient_registration/bookmark/create' do
    it 'responds successfully' do
      post patient_registration_bookmarks_path(patient_registration_record.id)
      expect(response.status).to eq 302
    end

    it 'データーベースへの保存が成功すること' do
      expect do
        post patient_registration_bookmarks_path(patient_registration_record.id)
      end.to change { Bookmark.count }.by(1)
    end
  end

  describe 'Patient_registration/bookmark/destroy' do
    let!(:bookmark) { create(:bookmark, patient_registration: patient_registration_record, user: user) }

    it '削除されること' do
      expect do
        delete patient_registration_bookmarks_path(patient_registration_record.id, bookmark.id)
      end.to change { Bookmark.count }.by(-1)
    end
  end
end
