class User < ApplicationRecord
  def recent_post
    Post.where(user: self).order(created_at: :desc).limit(3)
  end
end
