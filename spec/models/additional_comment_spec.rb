# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdditionalComment, type: :model do
  let(:user) { create(:user) }
  let(:patient_registration) { create(:patient_registration) }
  let(:additional_comment) do
    build(:additional_comment, user_id: user.id, patient_registration_id: patient_registration.id)
  end

  describe 'バリデーション' do
    context 'コメントが投稿できる' do
      it 'フォームを正しく入力すれば投稿できる' do
        expect(additional_comment.valid?).to eq(true)
      end

      it '投稿内容が１００文字以下' do
        expect(additional_comment.valid?).to eq(true)
      end
    end

    context 'コメントが投稿できない' do
      it '投稿が空欄' do
        additional_comment.content = ''
        expect(additional_comment.valid?).to eq(false)
      end

      it 'user_idがない' do
        additional_comment.user_id = ''
        expect(additional_comment.valid?).to eq(false)
      end

      it 'patient_registration_idがない' do
        additional_comment.patient_registration_id = ''
        expect(additional_comment.valid?).to eq(false)
      end
    end
  end
end
