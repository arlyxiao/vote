# -*- encoding : utf-8 -*-
class VoteResult < ActiveRecord::Base
  # --- 模型关联
  belongs_to :user
  belongs_to :vote
  has_many :vote_result_items
  accepts_nested_attributes_for :vote_result_items
  
  
  # --- 校验方法
  validates :user, :vote, :presence => true
  
  # 校验是否重复投票
  validate :validate_is_revote_by_user
  def validate_is_revote_by_user
    errors.add(:base, '用户重复投票了') if self.vote.has_voted_by?(self.user)
  end

end
