class LikesController < ApplicationController
  def create
    like = Like.new(author_id: params[:user_id], post_id: params[:post_id])
    like.save
    if like.save
      redirect_back(fallback_location: root_path)
    end
  end
end
