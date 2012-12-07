class StoryComment < ActiveRecord::Base
  belongs_to :story
  attr_accessible :comment, :story_id, :user_id

  validates :comment,  :presence => true
  validates :story_id,  :presence => true
  validates :user_id,  :presence => true
end
