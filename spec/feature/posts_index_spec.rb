require 'rails_helper'

RSpec.describe 'User Index page:', type: :feature do
  before(:all) do
    @first_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1461948573049-a5ab4efb6150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2865&q=80',
                             bio: 'Teacher from Mexico.', posts_counter: 0)
    @post_one =  Post.create(author: @first_user, title: "Tom post 1.", text: "Post 1 by Tom.",
                             comments_counter: 0, likes_counter: 0)
  end

  before(:each) do
    visit user_posts_path(@first_user)
  end

  it 'should have the users profile picture' do
    expect(page).to have_xpath("//img[@src ='#{@first_user.photo}']")
  end

  it "should have the user's username" do
    expect(page).to have_text(@first_user.name)
  end

  it "should show the user's posts number" do
    expect(page).to have_text(/#{@first_user.posts_counter} posts/i)
  end

  it "should have the post's title" do
    expect(page).to have_text(@post_one.title)
  end

  it "should have some of the post's body" do
    expect(page).to have_text(@post_one.text)
  end

  it "should have the first comments on a post" do
    @comment = Comment.create(post: @post_one, author: @first_user, text: "Hi Tom! My 1 comment" )
    visit user_post_path(@first_user,@post_one)

    expect(page).to have_text(@comment.text)
  end

  it "should have how many comments a post has" do
    expect(page).to have_text(/#{@post_one.comments_counter} comments/)
  end

  it "should have how many likes a post has" do
    expect(page).to have_text(/#{@post_one.likes_counter} likes/)
  end

  it "should have the section for pagination if there are more posts than fit on the view" do
    expect(page).to have_text('Pagination')
  end

  it "should redirect to the post's show page when clicked in a post" do
    click_on 'Post 1'

    expect(page).to have_current_path(user_post_path(@first_user, @post_one))
  end
end