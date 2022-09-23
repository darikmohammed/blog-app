class CommentsController < ApplicationController
  def new
    @post_holder_user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end
  def create

  end
end
