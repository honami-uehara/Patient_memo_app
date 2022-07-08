# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let!(:user) { create(:user) }
  let!(:patient_registration) { create(:patient_registration) }
  let!(:bookmark) { create(:bookmark, user_id: user.id, patient_registration_id: patient_registration.id) }

  describe 'ブックマーク機能' do
    context 'ブックマークできる場合' do
      it 'user_id,post_idがあれば保存できる' do
        expect(bookmark.valid?).to eq(true)
      end

      it 'post_idが同じでもuser_idが違えばブックマークできる' do
        bookmark2 = create(:bookmark)
        expect(create(:bookmark, user_id: bookmark2.user_id).valid?).to eq(true)
      end

      it 'user_idが同じでもpatient_registration_idが違えばブックマーク出来る' do
        bookmark2 = create(:bookmark)
        expect(create(:bookmark, patient_registration_id: bookmark2.patient_registration_id).valid?).to eq(true)
      end
    end

    context 'ブックマークできない場合' do
      it 'user_idがない' do
        bookmark.user_id = ''
        expect(bookmark.valid?).to eq(false)
      end

      it 'patient_registration_idがない' do
        bookmark.patient_registration_id = ''
        expect(bookmark.valid?).to eq(false)
      end

      it 'user_id,patient_registration_id両方が一致しないとブックマークできない' do
        bookmark.user_id = 'test1111'
        bookmark.patient_registration_id = 'test2222'
        expect(bookmark.valid?).to eq(false)
      end
    end
  end
end
