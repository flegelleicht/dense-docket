class VisitorsController < ApplicationController
  def new
    @event = Event.new
  end
end
