# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
    sign_out @user
    debugger
    if current_user.nil?
      render json: {code: 200, msg: "user has been logged out", data: []}
    else
      render json: {code: 500, msg: "error while doing logout", data: []}
    end
    # super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
