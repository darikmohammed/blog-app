class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: @user)
  end

  def show
    @post = Post.find_by(id: params[:id], author_id: params[:user_id])
    @comments = @post.most_recent_comments
  end

  def new
    @new_post = Post.new
    @user = current_user
  end

  def create
    post = Post.new(author: current_user, title: params[:title], text: params[:text], comments_counter: 0,
                    likes_counter: 0)
    post.save

    if post.save
      redirect_to user_posts_path(current_user)
    else
      redirect_to new_user_post_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = 'Post has been deleted!'
    redirect_to user_posts_path(current_user)
  end
end
