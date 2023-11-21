class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]
  before_action :redirect_if_authenticated, only: [:new, :create] 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.active = true
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, flash: { success: 'Registration successfully' }
    else
      render :new
    end
  end

  def index
    @user = User.where(active: true)
    @roles = Role.where(active: true)
  end

  def assign_role
    @user = User.where(id: params[:registration_id]).update(role_id: params[:role_id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end