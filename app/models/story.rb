class Story < ActiveRecord::Base
  has_many :story_comments
  belongs_to :user
  
  attr_accessible :description, :state, :title, :user_id
end
