# -*- encoding : utf-8 -*-
class VoteResultItem < ActiveRecord::Base
  validates :user_id, :vote_id, :vote_item_id, :select_limit, :presence => true
  # before_save :not_duplicate

  belongs_to :user, :class_name => 'User', :foreign_key => :user_id
  belongs_to :vote_item, :class_name => 'VoteItem', :foreign_key => :vote_item_id
  belongs_to :vote, :class_name => 'Vote', :foreign_key => :vote_id
  
  def less_than_select_limit(selected_count)
    return true if selected_count <= self.select_limit
	  return false
  end
  
	def is_duplicate?(user_id = self.user_id, vote_id = self.vote_id)
	  return VoteResultItem.where(:user_id => user_id, :vote_id => vote_id).exists?
	end
	
	def vote_count_by_user(user_id, vote_id)
	  VoteResultItem.where(
	    :user_id => user_id, 
	    :vote_id => vote_id
	  ).order('id desc').count

	end
end
