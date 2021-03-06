class EventsController < ApplicationController
  def create
    @plan = Plan.find(params[:plan_id])
    @event = @plan.events.create(event_params)
    redirect_to plan_path(@plan)
  end
  
  def edit
    @plan = Plan.find(params[:plan_id])
    @event = @plan.events.find(params[:id])
  end
  
  def update
    @plan = Plan.find(params[:plan_id])
    @event = @plan.events.find(params[:id])
    
    if @event.update(event_params)
			redirect_to @event.plan
		else
			render 'edit'
		end
  end    
  
  def destroy
    @plan = Plan.find(params[:plan_id])
    @event = @plan.events.find(params[:id])
    @event.destroy
    redirect_to plan_path(@plan)
  end
  
  private
  
  def event_params
    params.require(:event).permit(:title, :start, :end, :lead_days)
  end
end
