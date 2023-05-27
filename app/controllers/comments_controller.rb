class CommentsController < ApplicationController
  before_action :require_login

  def create
  @post = Post.find(params[:post_id])
  @comment = @post.comments.build(comment_params)
  @comment.user = current_user
  
  if @comment.save
    redirect_back(fallback_location: @post, notice: 'Comment created successfully.')
  else
    # Handle error case
  end
end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def require_login
    redirect_to new_session_path unless logged_in?
  end
end