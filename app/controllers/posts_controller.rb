class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: @user)

    respond_to do |format|
      format.html
      format.json {render json:@posts}
    end
  end

  def show
    @post = Post.find_by(id: params[:id], author_id: params[:user_id])
    @comments = @post.most_recent_comments

    respond_to do |format|
      format.html
      format.json {render json:@post.comments}
    end
  end

  def new
    @new_post = Post.new
    @user = current_user
  end

  def create
    respond_to do |format|
      format.html do
        post = Post.new(author: current_user, title: params[:title], text: params[:text], comments_counter: 0,
                        likes_counter: 0)
        post.save
        if post.save
          redirect_to user_posts_path(current_user)
        else
          redirect_to new_user_post_path
        end
      end

      format.json do
        authenticate_request
        post = Post.new(author: current_user, title: params[:title], text: params[:text], comments_counter: 0,
                        likes_counter: 0)
        render json: "New Post created by #{current_user.name}" if post.save
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = 'Post has been deleted!'
    redirect_to user_posts_path(current_user)
  end
end
