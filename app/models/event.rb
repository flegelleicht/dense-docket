class Event < ApplicationRecord
  belongs_to :plan
  validates :title, presence: true, length: { minimum: 1 }
end
