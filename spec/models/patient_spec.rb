# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Patient, type: :model do
  let(:patient) { create(:patient, user: user) }
  let!(:user) { create(:user) }

  describe 'バリデーション' do
    context '登録する' do
      it '全ての項目の入力されている' do
        expect(patient.valid?).to eq(true)
      end
    end
  end

  context '登録できない' do
    it '名前が空欄' do
      patient.name = ''
      expect(patient.valid?).to eq(false)
    end

    it '注意することが空欄' do
      patient.warn = ''
      expect(patient.valid?).to eq(false)
    end

    it '電話番号が空欄' do
      patient.phone_number = ''
      expect(patient.valid?).to eq(false)
    end

    it 'カルテ番号が空欄' do
      patient.medical_record_number = ''
      expect(patient.valid?).to eq(false)
    end

    it 'メンテort治療選択が空欄' do
      patient.maintenance_or_treatment = ''
      expect(patient.valid?).to eq(false)
    end

    it '来院日選択が空欄' do
      patient.visit_date = ''
      expect(patient.valid?).to eq(false)
    end
  end

  context 'アソシエーション' do
    it 'user_idが紐づいてるか' do
      expect(FactoryBot.build(:patient).user_id).to eq 1
    end
  end

  context '日付に関するバリデーション' do
    let(:patient_date) { FactoryBot.build(:patient, visit_date: '2023-05-02') }

    it '来院日が今日より先の日付だと登録できないこと' do
      expect(patient_date.valid?).to eq(false)
      expect(patient_date.errors.messages[:base]).to include('今日を含む過去の日付を入力して下さい')
    end
  end
end
