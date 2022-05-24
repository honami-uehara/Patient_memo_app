class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(params.require(:post).permit(:name, :warn, :phone_number, :medical_record_number, :maintenance_or_treatment, :visit_date))
    @post.user_id = current_user.id
    if @post.save
      redirect_to :posts
      flash[:notice] = "登録が完了しました"
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @bookmark = Bookmark.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post = Post.update(params.require(:post).permit(:name, :warn, :phone_number, :medical_record_number, :maintenance_or_treatment, :visit_date))
      flash[:notice] = "患者情報を更新しました"
      redirect_to :posts
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "患者登録を削除"
    redirect_to :posts
  end
end
