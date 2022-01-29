class PostsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @posts = Post.all
  end

  def create
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post was created successfully."
      redirect_to @post 
    else
      render 'new'
    end
  rescue => exception
    puts "I am MISHA"
    puts exception.message
    puts exception.backtrace
    redirect_to @post
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

  def new
  end
  
  def show
  end

  def edit
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :description)
  end
end