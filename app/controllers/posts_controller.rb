class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      group = Group.find(post_params[:group_id])
      recipients = User.includes(:groups).where(groups: {id: post_params[:group_id]}).to_a
      UserMailer.new_post_email(current_user, group, recipients).deliver_later
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:subject, :description, :group_id)
  end
end
