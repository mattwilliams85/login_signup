class User < ActiveRecord::Base
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates_format_of :email, :with => /@/
  validates :password, :presence => true, :on => :create
  validates_format_of :password, :with => /(?=.*[\d\W])/,
        :message => "must contain at least one number or special character", :on => :create
  validates_length_of :password, :maximum => 20, :on => :create
  validates_length_of :password,  :minimum => 7, :on => :create
  has_secure_password

end
