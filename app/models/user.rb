class User < ActiveRecord::Base
  has_many :story, :dependent => :destroy
  has_many :story_comment, :dependent => :destroy
  
  attr_accessible :email, :login, :password

  validates :login,  :presence => true, 
                     :uniqueness => true, 
                     :length => {:minimum => 1, :maximum => 254}

  validates :email, :presence => true, 
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  validates :password, :presence => true, 
                       :length => {:minimum => 5, :maximum => 254}

  def authenticate(email, password)
    user = User.find_by_email(email)
    if user.password == password
      user
    else
      nil
    end
  end

end
