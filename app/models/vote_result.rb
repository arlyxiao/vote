# -*- encoding : utf-8 -*-
class VoteResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :vote
  
  validates :user, :vote, :presence => true
end