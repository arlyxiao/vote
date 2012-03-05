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
    select_limit = params[:vote_result][:select_limit].to_i
    # 单选
    if select_limit == 1 then
      @vote_result = current_user.vote_results.build(params[:vote_result])
      @vote_result.save
    end
    
    # 多选
    if select_limit > 1 then
      items = params[:vote_items]
      return redirect_to :back if items.nil?

      
      # 循环保存投票结果
      items.each do |vote_item_id|
        next if vote_item_id.empty?

        @vote_result_item = VoteResultItem.new(params[:vote_result_item])
        
        if @vote_result_item.less_than_select_limit?(items.length)
		      @vote_result_item.user = current_user
		      @vote_result_item.vote_item_id = vote_item_id
		      @vote_result_item.save
		    else
		      error = @vote_result_item.errors.first
	        flash[:notice] = "限选数目不应大于选项数"
	        return redirect_to :back
		    end
      end
      
    end
    
    return redirect_to "/votes/#{@vote_result.vote_id}/result"
    
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
