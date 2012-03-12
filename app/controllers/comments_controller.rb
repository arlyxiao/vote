class CommentsController < ApplicationController
  before_filter :login_required
  before_filter :pre_load
  
  def pre_load
    @vote = Vote.find(params[:vote_id]) if params[:vote_id]
    @comment = Comment.find(params[:id]) if params[:id]
  end
  
  def create
    @comment = @vote.comments.build(params[:comment])
    @comment.creator = current_user
    if !@comment.save
      error = @comment.errors.first
      flash[:error] = "#{error[0]} #{error[1]}"
    end
    redirect_to "/votes/#{@vote.id}/result"
  end
  
  def reply
  end
  
  def do_reply
    vote = @comment.model
    reply_comment = vote.comments.build(params[:comment])
    reply_comment.reply_comment_id = @comment.id
    reply_comment.creator = current_user
    if reply_comment.save
      return redirect_to "/votes/#{vote.id}/result"
    end
    error = reply_comment.errors.first
    flash[:error] = "#{error[0]} #{error[1]}"
    redirect_to "/votes/#{vote.id}/result"
  end
end
