class VoteResultsController < ApplicationController
  # 保存投票结果
  def create
    @vote_result = current_user.vote_results.build(params[:vote_result])
    return redirect_to "/votes/#{params[:vote_result][:vote_id]}/result" if @vote_result.save
        
    error = @vote_result.errors.first
	  flash[:notice] = "#{error[0]} #{error[1]}"
	  return redirect_to "/votes/#{params[:vote_result][:vote_id]}"
    
  # 结束投票
  end

end
