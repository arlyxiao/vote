# -*- encoding : utf-8 -*-
class Vote < ActiveRecord::Base
  
  # --- 模型关联
  has_many :vote_results, :dependent => :destroy
  has_many :voted_users, :through => :vote_results, :source => :user
  
  has_many :vote_items, :dependent => :destroy
  has_many :vote_result_items, :through => :vote_items
  
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator_id
  
  
  accepts_nested_attributes_for :vote_items
  
  # --- 校验方法
  
  validates :creator, :title, :select_limit, :presence => true
  
  validate :validate_vote_items_count
  def validate_vote_items_count
    votes_length = self.vote_items.length
    
    errors.add(:base, '选项应至少有2项') if votes_length < 2
    errors.add(:base, '限选数目不应大于选项数') if self.select_limit > votes_length
    errors.add(:base, '限选数目应至少为1项') if self.select_limit < 1
  end
  
  # 当前投票是否是单选
  def is_single?
    return 1 == self.select_limit
  end
  
  # 判断当前投票有没有指定user参与过
  def has_voted_by?(user)
    return false if user.blank?
    VoteResult.where(:user_id => user.id, :vote_id => self.id).exists?
  end
  
  # 返回某用户在此投票下投过的选项
  def voted_items_by(user)
    return [] if user.blank?
    VoteResult.where(:user_id => user.id, :vote_id => self.id).first.vote_result_items.map{|x|
      x.vote_item
    }
  end
  
  # 引用其它类
  include Comment::CommentableMethods
  
  
  # --- 给其他类扩展的方法
  
  module UserMethods
    def self.included(base)
      base.has_many :votes, :foreign_key => :creator_id
      base.has_many :vote_result_items
      base.has_many :vote_results
      base.has_many :voted_votes, :through => :vote_results, :source => :vote
      
      base.send(:include, InstanceMethods)
    end
    
    module InstanceMethods
      # nothing ...
    end
  end
  
end

