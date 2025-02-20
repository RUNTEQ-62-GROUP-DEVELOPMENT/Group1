# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # def current_or_guest_user
  #   current_user || gest_user = User.find(0) || User.create!(id: 0, name: "Gest", email: "gest@test.com", password: "gestuser")
  # end
  
  def current_or_guest_user
    # current_user が存在すればそのまま返す
    return current_user if current_user
  
    # ID 0 のユーザーを検索、見つからなければ作成する
    guest_user = User.find_or_create_by(id: 0) do |user|
      user.name = "Guest"
      user.email = "guest@test.com"
      user.password = "guestuser"
    end
  
    # guest_user を返す
    guest_user
  end

  protected

  def configure_permitted_parameters
    # /users/sign_up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
