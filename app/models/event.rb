class Event < ApplicationRecord
  belongs_to :plan
  validates :title, presence: true, length: { minimum: 1 }
  
  def is_on?(date)
    date >= self.start && date <= self.end
  end
end
