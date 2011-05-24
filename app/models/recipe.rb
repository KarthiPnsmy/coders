class Recipe < ActiveRecord::Base
  require 'will_paginate'
  
  has_attached_file :avatar
  #cattr_reader :per_page
  #@@per_page = 3
  
  # new columns need to be added here to be writable through mass assignment
  #attr_accessible :user_id, :user_name, :name, :is_veg, :category, :sub_category, :video,:rating, :tag, :steps, :comments, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at
  
  validates_presence_of :name

end
