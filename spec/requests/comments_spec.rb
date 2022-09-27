require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'GET /new' do
    before(:each) do
      @first_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1461948573049-a5ab4efb6150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2865&q=80',
                                bio: 'Teacher from Mexico.', posts_counter: 0)
      @post_one =  Post.create(author: @first_user, title: "Tom post 1.", text: "Post 1 by Tom.",
                               comments_counter: 0, likes_counter: 0)
    end
    it 'returns http success' do
      get new_user_post_comment_path(@first_user, @post_one)
      expect(response).to have_http_status(:success)
    end
  end
end
