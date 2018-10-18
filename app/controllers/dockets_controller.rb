class DocketsController < ApplicationController
  def index
    @dockets = current_user.dockets
  end
  
  def show
    @docket = current_user.dockets.find(params[:id])
  end
  
  def new
    @docket = current_user.dockets.create(docket_params)
  end
  
  def edit
    @docket = current_user.dockets.find(params[:id])
  end
  
  def create
    @docket = current_user.dockets.create(docket_params)
    if @docket.save
      redirect_to @docket
    else
      render 'new'
    end
  end
  
  def update
    @docket = current_user.dockets.find(params[:id])
    
    if @docket.update(docket_params)
      redirect_to @docket
    else
      render 'edit'
    end
  end
  
  def destroy
    @docket = current_user.dockets.find(params[:id])
    @docket.destroy
    
    redirect_to dockets_path
  end
  
  private
  
  def docket_params
    params.require(:docket).permit(:title, :start, :end)
  end
end
