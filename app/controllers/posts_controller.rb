class PostsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  

  def index
    @posts = Post.all
    if params[:order] == 'created_at'
      @posts = Post.order(created_at: :desc)
    else
      @posts = Post.order(updated_at: :desc)
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post created successfully.'
    else
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Post deleted successfully!'
  end

  def upvote
    @post = Post.find(params[:id])
    unless current_user.upvotes.exists?(post_id: @post.id)
      current_user.upvotes.create(post_id: @post.id)
    end
    redirect_to posts_path
  end

  def downvote
    @post = Post.find(params[:id])
    unless current_user.downvotes.exists?(post_id: @post.id)
      current_user.downvotes.create(post_id: @post.id)
    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def require_login
    redirect_to new_session_path unless logged_in?
  end
end
