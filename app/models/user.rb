# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  :presence => true,
                    :length   => { :maximum => 50 }
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  
  has_secure_password
  validates :password, :presence     => {:on => :create},
                       :on           => :create,
                       :confirmation => true,
                       :length       => { :within => 6..40 }
                       
  def self.authenticate(email, submitted_password)
    user = self.find_by_email(email)
    return nil  if user.nil?
    return user if user.authenticate(submitted_password)
  end
        
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.make_salt == cookie_salt) ? user : nil
  end    
  
  def make_salt
    #secure_hash("#{Time.now.utc}--#{password}")
    # TODO: fix security loophole!
    secure_hash("#{password}")
  end 
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end    
end

