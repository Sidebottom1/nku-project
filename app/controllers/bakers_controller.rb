class BakersController < ApplicationController
  
  def index
    @bakers = Baker.all
  end
  
  def new
    @baker = Baker.new
  end
  
  def create
    @baker = Baker.new(baker_params)
    
    if @baker.save
      session[:baker_id] = @baker.id
      redirect_to @baker, notice: "You have successfully created your student profile."
    else
      render 'new'
    end
  end
  
  def show
    @baker = Baker.find(params[:id])
  end
  
  def edit
    @baker = Baker.find(params[:id])
  end
  
  def update
    @baker = Baker.find(params[:id])
    
    if @baker == current_baker && @baker.update(params[:baker].permit(:name, :email, :password_digest))
      redirect_to @baker, notice: "You have successfully edited your profile."
    else
      render 'edit'
    end
  end
  
  private
    
  def baker_params
    params.require(:baker).permit(:name, :email, :password, :password_confirmation)
  end
end