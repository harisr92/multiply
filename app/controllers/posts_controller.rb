# :no-doc:
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show() end

  def new
    @post = Post.new
  end

  def edit() end

  def create
    post = Post.new(post_params)
    if post.save
      flash[:notice] = 'A new Post is Created'
      redirect_to posts_path
    else
      flash[:alert] = post.errors.full_messages.join(' and ')
      redirect_to new_post_path
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Updated the Post'
      redirect_to post_path(@post)
    else
      flash[:alert] = @post.errors.full_messages.join(' and ')
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = 'Post deleted'
    else
      flash[:alert] = @post.errors.full_messages.join(' and ')
    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
