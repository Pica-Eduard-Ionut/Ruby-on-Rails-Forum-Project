class CommentsController < ApplicationController
    before_action :set_post
  
    def create
      @comment = @post.comments.build(comment_params)
      if @comment.save
        redirect_to post_path(@post), notice: 'Comment created successfully.'
      else
        render 'posts/show'
      end
    end
  
    private
  
    def set_post
      @post = Post.find(params[:post_id])
    end
  
    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end
  end
  