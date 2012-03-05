# -*- encoding : utf-8 -*-
class VoteResultItem < ActiveRecord::Base
  # --- 模型关联
  belongs_to :user
  belongs_to :vote_item
  belongs_to :vote_result
  
  # --- 校验方法
  validates :user, :vote, :vote_item, :presence => true
  
  def less_than_select_limit?(voted_count)
    return true if voted_count <= self.select_limit
  end

end
