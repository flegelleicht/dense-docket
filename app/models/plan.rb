class Plan < ApplicationRecord
  has_many :events
  
  validates :title, presence:true, length: { minimum: 1 }
end
