class Event < ApplicationRecord
  belongs_to :plan
  validates :title, presence: true, length: { minimum: 1 }
  
  def is_on?(date)
    almost = if self.lead_days && self.start
      then date >= (self.start - self.lead_days) && date < self.start
    elsif self.lead_days && self.end
      then date >= (self.end - self.lead_days) && date < self.end
    else 
      false 
    end
    began = if self.start then date >= self.start else false end
    over  = if self.end   then date >  self.end   else false end
    
    almost || (began && !over)
  end
end
