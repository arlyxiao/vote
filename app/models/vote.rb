# -*- encoding : utf-8 -*-
class Vote < ActiveRecord::Base
  
  # --- 模型关联
  
  has_many :vote_items
  has_many :vote_result_items
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator_id
  
  accepts_nested_attributes_for :vote_items
  
  # --- 校验方法
  
  validates :creator_id, :title, :select_limit, :presence => true
  
  validate :validate_vote_items_count
  def validate_vote_items_count
    votes_length = self.vote_items.length
    
    errors.add(:base, '选项应至少有2项') if votes_length < 2
    errors.add(:base, '限选数目不应大于选项数') if self.select_limit > votes_length
    errors.add(:base, '限选数目应至少为1项') if self.select_limit < 1
  end
  
  # --- 业务逻辑方法
  
  def is_single?
    return 1 == self.select_limit
  end
  
  def selected_items_by_user(user_id, vote_id = self.id)
    VoteResultItem.find_all_by_user_id_and_vote_id(user_id, vote_id)
  end
  
  def selected_items
    VoteResultItem.where(
	    :vote_id => self.id
	  ).order('id desc').group(:user_id)
  end
  
  # --- 给其他类扩展的方法
  
  module UserMethods
    def self.included(base)
      base.has_many :votes, :foreign_key => :creator_id
      base.has_many :vote_result_items
      base.send(:include, InstanceMethods)
    end
    
    module InstanceMethods
      def selected_votes
        VoteResultItem.find(
          :all,
          :conditions => { :user_id => self.id },
          :group => :vote_id,
          :order => 'id desc'
        )
      end
    end
  end
  
end

