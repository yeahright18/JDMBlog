class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Zalogowano pomyslnie"
      redirect_to user
    else
      flash.now[:alert] = "Nieprawidlowy email badz haslo"
      render 'new'
    end
  end


  def destroy
    session[:user_id] = nil
    flash[:notice] = "Wylogowano pomyslnie"
    redirect_to root_path
  end

end
