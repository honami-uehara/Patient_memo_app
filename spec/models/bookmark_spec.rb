 require 'rails_helper'

 RSpec.describe Bookmark, type: :model do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }
  let!(:bookmark) { create(:bookmark, user_id: user.id, post_id: post.id) }

  describe 'ブックマーク機能' do
    context 'ブックマークできる場合' do
      it "user_id,post_idがあれば保存できる" do
        expect(bookmark).to be_valid
      end

      it "post_idが同じでもuser_idが違えばブックマークできる" do
        bookmark2 = create(:bookmark)
        expect(create(:bookmark, user_id: bookmark2.user_id)).to be_valid
      end

      it "user_idが同じでもpost_idが違えばブックマーク出来る" do
        bookmark2 = create(:bookmark)
        expect(create(:bookmark, post_id: bookmark2.post_id)).to be_valid
      end
    end

    context 'ブックマークできない場合' do
      it "user_idがない" do
        bookmark.user_id = ""
        expect(bookmark.valid?).to eq(false)
      end

      it "post_idがない" do
        bookmark.post_id = ""
        expect(bookmark.valid?).to eq(false)
      end

      it "user_id,post_id両方が一致しないとブックマークできない" do
        bookmark.user_id = "test1111"
        bookmark.post_id = "test2222"
        expect(bookmark.valid?).to eq(false)
      end
    end
  end
end
