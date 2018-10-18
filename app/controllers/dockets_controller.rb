class DocketsController < ApplicationController
  def new
  end
  
  def create
    @docket = Docket.new(article_params)
    @docket.save
    redirect_to @docket
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
