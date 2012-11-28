class User < ActiveRecord::Base
  has_many :story
  has_many :story_comment
  attr_accessible :email, :login, :password
end
