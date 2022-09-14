# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

# Create at least 4 posts written by one of the users you created by running the following code:
(1..4).each do |i|
  Post.create(author: first_user, title: "My Post #{i}", text: "This is my #{i} post")
end


# Create at least 6 posts comments for one of the posts you created by running the following code:
first_post = Post.first
(1..6).each do |i|
  Comment.create(post: first_post, author: second_user, text: "Hi Tom! My #{i} comment" )
end
