class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      sign_out current_user
      redirect_to root_path
    else
      @user = User.find(params[:id])
      @recent_posts = @user.recent_post
    end
  end

  # def create
  #   respond_to do |format|
  #     format.json do
  #       @user = User.new(name: params[:name], photo: params[:photo], bio: params[:bio], posts_counter: 0,
  #                        email: params[:email], password: [params.password], password_confirmation: params[:password_confirmation])
  #       if @user.save
  #         render json: @user, status: :created
  #       else
  #         render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
  #       end
  #     end
  #   end
  # end
end
