class PostsController < ApplicationController
  before_action :set_category, only: [:new, :create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @category = Category.find(params[:category_id])
    @posts = @category.posts
  end
  

  def show
    
    @comment = Comment.new
  end

  def new
    @post = @category.posts.build
  end

  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.new(post_params.except(:user_id))
  
    if @post.save
      redirect_to category_path(@category), notice: 'Post created successfully.'
    else
      render :new
    end
    def destroy
      @post = Post.find(params[:id])
      @category = @post.category
    
      if @post.destroy
        redirect_to category_path(@category), notice: 'Post deleted successfully.'
      else
        redirect_to category_path(@category), alert: 'Failed to delete the post.'
      end
    end
    
    
  end
  
  
  
  

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post deleted successfully.'
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
  
end
