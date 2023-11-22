class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]
  before_action :redirect_if_authenticated, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.present? && @user.authenticate(params[:user][:password]) && params[:user][:capcha] == params[:user][:enter_capcha]
      session[:user_id] = @user.id
      redirect_to root_path, flash: { success: 'Logged in successfully' }
    elsif params[:user][:capcha] != params[:user][:enter_capcha]
      redirect_to new_session_path, flash: { success: 'Enter Correct Capcha' }
    else
      render :new
    end
  end

  def report
    @tasks = Task.where(active: true)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: { success: 'Logged Out' }
  end
end