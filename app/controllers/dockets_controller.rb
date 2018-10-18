class DocketsController < ApplicationController
  def new
  end
  
  def create
    render plain: params[:docket].inspect
  end
end
