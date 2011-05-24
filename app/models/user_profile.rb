class UserProfile < ActiveRecord::Base
  belongs_to :user
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :profile_name, :address, :phone, :mobile, :user_id, :gender
    
  validates_numericality_of :phone, :mobile
  validates_length_of :profile_name, :maximum => 256
  validates_length_of :address, :maximum => 500

end
