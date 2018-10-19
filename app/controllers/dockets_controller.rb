class DocketsController < ApplicationController
  def index
    @dockets = current_user.dockets
  end
  
  def show
    @docket = current_user.dockets.find(params[:id])
  end
  
  def new
    @docket = Docket.new
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

    parms = docket_params
    parms['plans'] = parms.to_hash['plans']
      .map{|id| current_user.plans.find(id.to_i)} if parms.to_hash['plans']
    
    if @docket.update(parms)
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
    params.require(:docket).permit(:title, :start, :end, :plans => [])
  end
end
