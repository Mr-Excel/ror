class Users::GenericController < ApplicationController
  layout "react"
  before_action :authenticate_user!
  def index
    @users = User.all
    @data = {:users => @users}



    
  end
end
