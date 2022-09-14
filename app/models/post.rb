class Post < ApplicationRecord
  belongs_to :user

  after_create :update_posts_count
  def update_posts_count
    user.posts_counter = 0 unless user.posts_counter?
    user.posts_counter += 1
    user.save
  end
end
