# app/controllers/votes_controller.rb

class VotesController < ApplicationController
    def upvote
      post = Post.find(params[:id])
      vote = current_user.votes.find_or_initialize_by(post: post)
      if vote.persisted?
        vote.update(value: 1)
      else
        vote.save
      end
      calculate_vote_difference(post)
    end
  
    def downvote
      post = Post.find(params[:id])
      vote = current_user.votes.find_or_initialize_by(post: post)
      if vote.persisted?
        vote.update(value: -1)
      else
        vote.save
      end
      calculate_vote_difference(post)
    end
  
    private
  
    def calculate_vote_difference(post)
      upvotes = post.votes.where(value: 1).count
      downvotes = post.votes.where(value: -1).count
      post.update(vote_difference: upvotes - downvotes)
      head :ok
    end
  end
  