class RolesController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    @role.active = true
    @role.created_at = Time.zone.now
    if @role.save
      session[:user_id] = @role.id
      redirect_to root_path, flash: { success: 'Role Succesfully Created' }
    else
      render :new
    end
  end

  def role_params
    params.require(:role).permit(:name)
  end
end
