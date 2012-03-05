# -*- encoding : utf-8 -*-
class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end


  def new
    @vote = Vote.new
  end
  
  # 创建投票
  def create
    return redirect_to votes_path if params[:vote].blank?
    
    @vote = current_user.votes.build(params[:vote])
    return redirect_to @vote if @vote.save

    error = @vote.errors.first
	  flash.now[:error] = "#{error[0]} #{error[1]}"
	  render :action => :new
 
  end

  def show
    return redirect_to votes_path if params[:id].blank?
    
    @vote = Vote.find(params[:id])
    @vote_result = VoteResult.new
  end
  
  
  # 保存投票结果
  def post_vote
    @vote_result = current_user.vote_results.build(params[:vote_result])
    return redirect_to "/votes/#{params[:vote_result][:vote_id]}/result" if @vote_result.save
        
    error = @vote_result.errors.first
	  flash[:notice] = "#{error[0]} #{error[1]}"
	  return redirect_to :back
    
  # 结束投票
  end
  
  
  # 显示投票结果
  def result
    @vote = Vote.find(params[:id])
  end
  
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy if @vote.creator == current_user
    
    return redirect_to votes_path
  end

end
