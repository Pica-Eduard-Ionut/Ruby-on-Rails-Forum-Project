class PostsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  

  def index
    #to order all posts in the order of creation from newest created to oldest
    @posts = Post.order(created_at: :asc)
  end
  def index_updated
    @posts = Post.order(updated_at: :asc)
    #have to render something or i get an error but it displays properly
    render :index
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
      redirect_to upvote_post_path(@post), notice: 'Post created successfully.'
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
    vote = current_user.votes.find_or_initialize_by(post: @post)
    if vote.vote == 1
      vote.destroy
    else
      vote.update(vote: 1)
    end
    redirect_to @post
  end
  
  def downvote
    @post = Post.find(params[:id])
    vote = current_user.votes.find_or_initialize_by(post: @post)
    if vote.vote == -1
      vote.destroy
    else
      vote.update(vote: -1)
    end
    redirect_to @post
  end
  def indexupvote
    @post = Post.find(params[:id])
    vote = current_user.votes.find_or_initialize_by(post: @post)
    if vote.vote == 1
      vote.destroy
    else
      vote.update(vote: 1)
    end
    redirect_to posts_path
  end
  
  def indexdownvote
    @post = Post.find(params[:id])
    vote = current_user.votes.find_or_initialize_by(post: @post)
    if vote.vote == -1
      vote.destroy
    else
      vote.update(vote: -1)
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
