class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])
    @data = {:user => @user}
  end

  def new
    @user = User.new
    @data = {:user => @user}
    @user.images.build

    @find = User.last
  end


  def update 
    debugger
  end

  def create
    x = User.new(user_params)
    debugger
    x.save
  end

  private
  def user_params 
    params.require(:user).permit(:first_name, :last_name,:email, :password, :password_confirmation, :gender, :date_of_birth, :company_id, user_teams_attributes: [:id, :team_id, :_destroy], user_roles_attributes: [:id, :role_id, :_destroy], dependents_attributes: [:id, :name, :gender, :relationship_id], images_attributes: [:id, :is_active, :_destroy, :image_data])
  end
end
