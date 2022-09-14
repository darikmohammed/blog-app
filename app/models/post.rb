class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :comments
  has_many :likes

  after_create :update_posts_count
  def update_posts_count
    user.posts_counter = 0 unless user.posts_counter?
    user.posts_counter += 1
    user.save
  end

  def most_recent_comments
    Comment.where(post: self).order(created_at: :desc).limit(5)
  end
end
