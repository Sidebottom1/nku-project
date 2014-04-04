class RequestsController < ApplicationController
  
  def new
    @request = Request.new
  end
  
  def create
    @request = Request.new(request_params)
    
    if @request.save
      redirect_to @request, notice: "Your request has been posted."
    else
      render 'new'
    end  
  end
  
  def index
    @requests = Request.all
  end
  
  def show
    @request = Request.find(params[:id])
  end
  
  private
    
  def request_params 
    params.require(:request).permit(:name, :email, :description)
  end
  
end