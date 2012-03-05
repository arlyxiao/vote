# -*- encoding : utf-8 -*-
class VoteItem < ActiveRecord::Base
  # --- 模型关联
  has_many :vote_result_items, :dependent => :destroy
  belongs_to :vote
  
  # --- 校验方法
  validates :item_title, :presence => true
end
