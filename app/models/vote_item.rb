# -*- encoding : utf-8 -*-
class VoteItem < ActiveRecord::Base
  # --- 模型关联
  has_many :vote_result_items, :dependent => :destroy
  belongs_to :vote
  
  # --- 校验方法
  validates :item_title, :presence => true
  
  
  IMAGE_PATH = "/:class/:attachment/:id/:style/:basename.:extension"
  IMAGE_URL  = "http://storage.aliyun.com/#{OssManager::CONFIG["bucket"]}/:class/:attachment/:id/:style/:basename.:extension"

  has_attached_file :image, :storage => :oss, :path => IMAGE_PATH, :url  => IMAGE_URL, :styles => { :medium => '300x300>', :thumb => '100x100>' }
end
