class User < ActiveRecord::Base
  has_many :story
  has_many :story_comment
  attr_accessible :email, :login, :password

  def authenticate(email, password)
    user = User.find_by_email(email)
    if user.password == password
      user
    else
      nil
    end
  end

end
