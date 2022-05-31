require 'rails_helper'

RSpec.describe "Bookmarks", type: :request do
  let(:user) { create(:user) }
  let(:post_record) { create(:post) }

   before do
     sign_in user
   end

  describe 'POST/bookmark/create' do
    it 'responds successfully' do
      post post_bookmarks_path(post_record.id)
      expect(response.status).to eq 302
    end

    it 'データーベースへの保存が成功すること' do
      expect do
        post post_bookmarks_path(post_record.id)
      end.to change{ Bookmark.count }.by(1)
    end
  end

  describe 'POST/bookmark/destroy' do
    let!(:bookmark) { create(:bookmark, post: post_record, user: user) }


    it '削除されること' do
      expect do
        delete post_bookmarks_path(post_record.id, bookmark.id)
      end.to change{ Bookmark.count }.by(-1)
    end
  end
end
