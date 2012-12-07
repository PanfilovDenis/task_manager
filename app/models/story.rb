class Story < ActiveRecord::Base
  has_many :story_comments, :dependent => :destroy
  belongs_to :user
  
  attr_accessible :description, :state, :title, :user_id

  validates :description,  :presence => true
  validates :state,  :presence => true
  validates :title,  :presence => true, :length => {:minimum => 1, :maximum => 254}
  validates :user_id,  :presence => true


#  state_machine :state, initial: :new do
#    event :start do
#      transition :accepted => :started
#    end
#
#    event :finish do
#      transition all => :finished
#    end
#  
#    event :accept do
#      transition [:new, :rejected] => :accepted
#    end
#
#    event :reject do
#      transition :new => :rejected
#    end
#
#  end  
end
