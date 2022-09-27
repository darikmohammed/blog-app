require 'rails_helper'

RSpec.describe 'User Index page:', type: :feature do
  let!(:user) do
    User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1461948573049-a5ab4efb6150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2865&q=80',
                bio: 'Teacher from Mexico.', posts_counter: 0)
  end
  before(:each) do
    visit users_path
  end
  it 'should show the root directory' do
    visit '/'
    expect(current_path).to eq(root_path)
  end

  it 'should see the username of all other users.' do
    expect(page).to have_text(user.name)
  end

  it 'should see the number of posts each user has written.' do
    expect(page).to have_text(/#{user.posts_counter} posts/i)
  end

  it 'should see the profile picture for each user' do
    expect(page).to have_xpath("//img[@src ='#{user.photo}']")
  end

  it "When I click on a user, should be redirected to that user's show page' " do
    within "div##{user.id}" do
      click_link
      expect(page).to have_current_path(user_path(user))
    end
  end
end
