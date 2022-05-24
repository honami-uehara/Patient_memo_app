 require 'rails_helper'

 RSpec.describe Bookmark, type: :model do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }
  let!(:bookmark) { create(:bookmark, user_id: user.id, post_id: post.id)}

  describe 'ブックマーク機能' do
    context 'ブックマークできる場合' do
      it "user_id,post_idがあれば保存できる" do
        expect(bookmark).to be_valid
      end
    end
  end
 end
