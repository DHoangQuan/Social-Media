class SessionsController < ApplicationController

  def new
    # byebug
    respond_to do |format|
      format.html { render :layout => false }
      format.js 
    end
  end

  def create
    # byebug  
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      # byebug
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new", :layout => false 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out!"
    # render "new", :layout => false 
    # byebug
    # respond_to do |format|
    #   format.html { render "sessions/new", :layout => false }
    #   format.js { render :new}
    # end
  end

end
