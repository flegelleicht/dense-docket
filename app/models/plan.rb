class Plan < ApplicationRecord
  has_many :events, dependent: :destroy
  
  validates :title, presence:true, length: { minimum: 1 }
end
