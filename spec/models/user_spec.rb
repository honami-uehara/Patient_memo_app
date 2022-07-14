# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'バリデーション' do
    context '登録できる' do
      let(:username) { '123456789' }
      it '全ての項目の入力されている' do
        expect(create(:user).valid?).to eq(true)
      end

      it '名前が１０文字以下' do
        expect(user.valid?).to eq(true)
      end
    end
  end

  context '登録できない' do
    it '名前欄が空白' do
      user.username = ''
      expect(user.valid?).to eq(false)
    end

    it 'メールアドレス欄が空白' do
      user.email = ''
      expect(user.valid?).to eq(false)
    end

    it 'パスワード欄が空白' do
      user.password = ''
      expect(user.valid?).to eq(false)
    end

    it 'パスワードと確認が一致していない' do
      user.password = 'test1111'
      user.password_confirmation = 'test2222'
      expect(user.valid?).to eq(false)
    end

    it '名前が１０文字以上だと登録できない' do
      user.username = '12345678901'
      expect(user.valid?).to eq(false)
    end

    it 'メールアドレスが重複していたら登録できないこと' do
      user1 = create(:user, username: 'test1', email: 'test1@example.com')
      expect(build(:user, username: 'test2', email: user1.email).valid?).to eq(false)
    end
  end
end

