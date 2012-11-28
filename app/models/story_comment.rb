class StoryComment < ActiveRecord::Base
  belongs_to :story
  attr_accessible :comment, :story_id, :user_id
end
