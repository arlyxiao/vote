# -*- encoding : utf-8 -*-
class VoteResultItem < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :vote_item
  belongs_to :vote
  
  validates :user, :vote, :vote_item, :select_limit, :presence => true
  
  def less_than_select_limit(voted_count)
    return true if voted_count <= self.select_limit
	  return false
  end
  
	def is_duplicate?(user_id = self.user_id, vote_id = self.vote_id)
	  return VoteResultItem.where(:user_id => user_id, :vote_id => vote_id).exists?
	end
end
