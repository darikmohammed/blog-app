require 'rails_helper'

RSpec.describe 'User Index page:', type: :feature do
  let!(:user) do
    User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1461948573049-a5ab4efb6150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2865&q=80',
                bio: 'Teacher from Mexico.', posts_counter: 0)
  end
  let!(:post) do
    Post.create(author: user, title: "Tom post 1.", text: "Post 1 by Tom.",
                comments_counter: 0, likes_counter: 0)
  end

  before(:each) do
    visit user_path(user)
  end

  it "should show the user's profile picture" do
    expect(page).to have_xpath("//img[@src='#{user.photo}']")
  end

  it "should have the user's user name" do
    expect(page).to have_text(user.name)
  end

  it 'should have the number of posts the user has written' do
    expect(page).to have_text(/#{user.posts_counter} posts/i)
  end

  it "should have the user's bio" do
    expect(page).to have_content(/#{user.bio}/i)
  end

  it 'should have the button see all posts' do
    expect(page).to have_text(/See all posts/i)
  end

  it "should redirect to the user's post's index page when see all posts clicked" do
    click_on 'See all posts'
    expect(page).to have_current_path(user_posts_path(user))
  end

  it "should redirect to the post's how page when I click the user's post" do
    click_on 'Post 1'

    expect(page).to have_current_path( user_post_path(user,post))
  end

end