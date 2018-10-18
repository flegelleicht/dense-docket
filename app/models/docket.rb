class Docket < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  
  # has_many :plans, through: :dockets_plans
  has_and_belongs_to_many :plans
  
  def weeks
    Enumerator.new do |e|
      fm = self.first_monday_around
      ls = self.last_sunday_around    
      d = fm
      while d <= ls
        e.yield [d, d+1, d+2, d+3, d+4, d+5, d+6]
        d += 7
      end
    end
  end
  

  def first_monday_around
    self.start - self.start.wday + 1
  end
  
  def last_sunday_around
    self.end - self.end.wday + 7
  end
end
