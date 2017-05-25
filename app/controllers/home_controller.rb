class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.includes(:users).where(users: { id: current_user.id })
    @posts = Post.where(group_id: @groups.pluck(:id)).order(created_at: :desc)
    @users = User.where(id: @posts.pluck(:user_id).uniq)
  end
end
