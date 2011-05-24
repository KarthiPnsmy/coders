class User < ActiveRecord::Base
  has_one :user_profile
  
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :name, :email, :password, :password_confirmation,:permission,:dob
  #attr_accessor :password
  
  validates_presence_of :name, :email, :password
  validates_format_of :name, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_length_of :password, :minimum => 4, :allow_blank => true
  validates_confirmation_of :password
end
