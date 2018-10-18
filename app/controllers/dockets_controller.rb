class DocketsController < ApplicationController
  def show
    @docket = Docket.find(params[:id])
  end
  
  def new
  end
  
  def create
    @docket = Docket.new(docket_params)
    @docket.save
    redirect_to @docket
  end
  
  private
  
  def docket_params
    params.require(:docket).permit(:title, :start, :end)
  end
end
