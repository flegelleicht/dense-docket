class Event
  def title
    'Big Event'
  end
  
  def date
    Date.civil(2018,10,26)
  end
  
  def countdown
    today = Date.today
    (date - today).to_i
  end
end
