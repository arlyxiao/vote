# -*- encoding : utf-8 -*-
class VotesController < ApplicationController
  before_filter :pre_load
  
  def pre_load
    @vote = Vote.find(params[:id]) if params[:id]
  end


  def index
    @votes = Vote.all
  end


  def new
    @vote = Vote.new
    if params[:type] == 'IMAGE'
      render :action => 'new_image'
    end
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

    @vote_result = VoteResult.new
  end
  
  
  
  # 显示投票结果
  def result
    @comments = @vote.comments
  end
  
  
  def destroy
    @vote.destroy if @vote.creator == current_user
    
    return redirect_to votes_path
  end
  
  # 当前用户发起的投票
  def byme
    @current_user_votes = current_user.votes.all
  end
  
  # 当前用户参与过的投票
  def has_voted
    @voted_by_current_user = current_user.vote_results.all
  end
  
  # 参与过指定:id投票的用户列表页
  def voted_users
    @voted_users = VoteResult.find_all_by_vote_id(params[:id])
  end

end
