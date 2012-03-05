# -*- encoding : utf-8 -*-
class VoteResult < ActiveRecord::Base
  # --- 模型关联
  belongs_to :user
  belongs_to :vote
  has_many :vote_result_items
  accepts_nested_attributes_for :vote_result_items
  
  
  # --- 校验方法
  validates :user, :vote, :presence => true
  
end
