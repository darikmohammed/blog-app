class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @recent_comments = @post.most_recent_comments
  end
  def create
    comment = Comment.new(author_id: params[:user_id], post_id: params[:post_id], text: params[:text])
    comment.save

    if comment.save
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
    else
      redirect_to new_user_post_comment_path
    end
  end
end
