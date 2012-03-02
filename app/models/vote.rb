# -*- encoding : utf-8 -*-
class Vote < ActiveRecord::Base
  validates :creator_id, :title, :select_limit, :presence => true
  validate :ensure_at_least_two_items
  
  has_many :vote_items
  has_many :vote_result_items
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator_id
  belongs_to :user, :class_name => 'User', :foreign_key => :user_id
  
  accepts_nested_attributes_for :vote_items
  
  
	def ensure_at_least_two_items
	 if self.vote_items.length < 2
	   errors.add(:item_title, self.vote_items.length)
	   return false
	  end
	  return true
	end
  
  def is_single?
    return self.select_limit == 1
  end
  
  def selected_items_by_user(user_id, vote_id = self.id)
    VoteResultItem.find_all_by_user_id_and_vote_id(user_id, vote_id)
  end
  
  def selected_items
    VoteResultItem.where(
	    :vote_id => self.id
	  ).order('id desc').group(:user_id)
  end
  
end

