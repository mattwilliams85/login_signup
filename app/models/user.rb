class User < ActiveRecord::Base
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates_format_of :email, :with => /@/
  validates :password, :presence => true
  validates_format_of :password, :with => /(?=.*[\d\W])/,
        :message => "must contain at least one number or special character"
  validates_length_of :password, :maximum => 20
  validates_length_of :password,  :minimum => 7
  has_secure_password

end
