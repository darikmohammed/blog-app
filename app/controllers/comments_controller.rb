class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @recent_comments = @post.most_recent_comments
  end

  def create
    respond_to do |format|
      format.json do
        authenticate_request
        comment = Comment.new(post_id: params[:post_id], author_id: current_user.id, text: parameters[:text])
        comment.save
        render json: "New Comment Added By #{current_user.name}"
      end
      format.html do
        comment = Comment.new(author: current_user, post_id: params[:post_id], text: params[:text])
        comment.save
        if comment.save
          redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
        else
          redirect_to new_user_post_comment_path
        end
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end
end
