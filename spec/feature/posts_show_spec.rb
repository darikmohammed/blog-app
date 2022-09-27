require 'rails_helper'

RSpec.describe 'Post Show page:', type: :feature do
  before(:all) do
    @first_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1461948573049-a5ab4efb6150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2865&q=80',
                              bio: 'Teacher from Mexico.', posts_counter: 0)
    @post_one =  Post.create(author: @first_user, title: "Tom post 1.", text: "Post 1 by Tom.",
                             comments_counter: 0, likes_counter: 0)
    @comment = Comment.create(post: @post_one, author: @first_user, text: "Hi Tom! My 1 comment" )

  end

  before(:each) do
    visit user_post_path(@first_user, @post_one)
  end

  it "should have the post's title" do
    expect(page).to have_text(@post_one.title)
  end

  it "should display who wrote the post" do
    expect(page).to have_text(/Author: #{@first_user.name}/)
  end

  it "should display how many comments it has" do
    expect(page).to have_text(/#{@post_one.comments_counter} Comments/)
  end

  it 'should display how many likes it has' do
    expect(page).to have_text(/#{@post_one.likes_counter} Likes/)
  end

  it 'should display the post body' do
    expect(page).to have_text(@post_one.text)
  end

  it 'should display the username of each commenter' do
    expect(page).to have_text(@comment.author.name)
  end

  it 'should display the comment each commenter left' do
    expect(page).to have_text(@comment.text)
  end
end