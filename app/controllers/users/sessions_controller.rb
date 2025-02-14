# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
    def new; end
  

  # POST /resource/sign_in
    def create
      @user = login(params[:email], params[:password])

      if @user
        redirect_to root_path
      else
        render :new, status: :unprocessable_entitye
      end
    end

  # DELETE /resource/sign_out
  def destroy
    logout
    redirect_to root_path, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
