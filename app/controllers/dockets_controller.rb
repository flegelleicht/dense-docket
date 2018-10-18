class DocketsController < ApplicationController
  def index
    @dockets = Docket.all
  end
  
  def show
    @docket = Docket.find(params[:id])
  end
  
  def new
    @docket = Docket.new
  end
  
  def create
    @docket = Docket.new(docket_params)
    if @docket.save
      redirect_to @docket
    else
      render 'new'
    end
  end
  
  private
  
  def docket_params
    params.require(:docket).permit(:title, :start, :end)
  end
end
