class RequestsController < ApplicationController
  
  def new
    @request = Request.new
  end
  
  def create
    @request = Request.new(request_params)
    
    if @request.save
      BakersMailer.request_email(Baker.all, @request).deliver
      redirect_to @request, notice: "Your request has been posted."
    else
      render 'new'
    end  
  end
  
  def update
    @request = Request.find(params[:id])
    
    if @request.update(params[:request].permit(:name, :email, :description, :baker_id))
      redirect_to @request, notice: "You have successfully taken this request."
    else
      render 'show'
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
    params.require(:request).permit(:name, :email, :description, :baker_id)
  end
  
end