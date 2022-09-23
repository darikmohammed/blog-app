class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @recent_comments = @post.most_recent_comments
  end
  def create

  end
end
