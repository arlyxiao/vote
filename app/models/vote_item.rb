# -*- encoding : utf-8 -*-
class VoteItem < ActiveRecord::Base
  
  has_many :vote_result_items, :dependent => :destroy
  belongs_to :vote
  
  validates :item_title, :presence => true
end
