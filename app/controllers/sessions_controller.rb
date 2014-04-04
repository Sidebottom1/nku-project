class SessionsController < ApplicationController
  
  def new
    @baker = Baker.new
  end
  
  def create
    baker = Baker.find_by_email(params[:email])
    if baker && baker.authenticate(params[:password])
      session[:baker_id] = baker.id
      redirect_to bakers_path, :notice => "Welcome back, #{baker.email}"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
    
  def destroy
    session[:baker_id] = nil
    redirect_to bakers_path, :notice => "Logged out!"
  end
    
end