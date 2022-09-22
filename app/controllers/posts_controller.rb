class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:comments, :author).where(author: @user)
  end

  def show
    @post = Post.find_by(id: params[:id], author_id: params[:user_id])
    @comments = @post.most_recent_comments
  end
end
