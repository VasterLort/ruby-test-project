class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post was created successfully."
      redirect_to @post 
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post was updated successfully."
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end

  def require_same_user
    if current_user != @post.user
      flash[:alert] = "You can only edit or delete your own post"
      redirect_to @post
    end
  end
end
