class Story < ActiveRecord::Base
  has_many :story_comments
  belongs_to :user
  
  attr_accessible :description, :state, :title, :user_id

  state_machine :state, initial: :new do
    event :start do
      transition :accepted => :started
    end

    event :finish do
      transition all => :finished
    end
  
    event :accept do
      transition [:new, :rejected] => :accepted
    end

    event :reject do
      transition :new => :rejected
    end

  end  
end
