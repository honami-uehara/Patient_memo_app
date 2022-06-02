require 'rails_helper'

RSpec.describe PatientRegistration, type: :model do
  let(:patient_registration) { create(:patient_registration) }
  let!(:user) { create(:user) }
  # let!(:visit_date) { build(:post, visit_date: Date.today + 1) }

  describe 'バリデーション' do
    context '登録する' do
      it '全ての項目の入力されている' do
        expect(create(:patient_registration)).to be_valid
      end
    end

    it '名前が１０文字以下' do
      expect(patient_registration.valid?).to eq(true)
    end
  end

  context '登録できない' do
    it '名前が空欄' do
      patient_registration.name = ''
      expect(patient_registration.valid?).to eq(false)
    end

    it '注意することが空欄' do
      patient_registration.warn = ''
      expect(patient_registration.valid?).to eq(false)
    end

    it '電話番号が空欄' do
      patient_registration.phone_number = ''
      expect(patient_registration.valid?).to eq(false)
    end

    it 'カルテ番号が空欄' do
      patient_registration.medical_record_number = ''
      expect(patient_registration.valid?).to eq(false)
    end

    it 'メンテort治療選択が空欄' do
      patient_registration.maintenance_or_treatment = ''
      expect(patient_registration.valid?).to eq(false)
    end

    it '来院日選択が空欄' do
      patient_registration.visit_date = ''
      expect(patient_registration.valid?).to eq(false)
    end
  end

  context 'アソシエーション' do
    it 'user_idが紐づいてるか' do
      expect(FactoryBot.build(:patient_registration).user_id).to eq 1
    end
  end

  # context "日付に関するバリデーション" do
  #   it "来院日が今日より先の日付だと登録できないこと" do
  #     expect(patient_registration.valid?).to be false
  #     expect(patient_registration.errors[:visit_date]).to include("は今日以前の日付で登録してください")
  #   end
  # end
end
