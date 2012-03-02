# -*- encoding : utf-8 -*-
class VoteItem < ActiveRecord::Base
  validates :item_title, :presence => true
  
  has_many :vote_result_items
  belongs_to :vote
  
  def selected_count
    return VoteResultItem.where(:vote_item_id => self.id).count
  end
  
  def selected_by_vote(vote_id)
    return VoteResultItem.where(:vote_id => vote_id).count
  end
end
