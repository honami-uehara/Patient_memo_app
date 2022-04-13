require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#create' do
    it '全ての項目の入力されれば登録できること' do
      expect(create(:user)).to be_valid
    end

    it 'バリデーションがかけれているか確認' do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it 'メールアドレスが重複していたら登録できないこと' do
      user1 = create(:user,username: "test1", email: "test1@example.com")
      expect(build(:user, username: "test2", email: user1.email)).to_not be_valid
    end
  end
end
