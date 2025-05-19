class Users::RegistrationsController < Devise::RegistrationsController
  layout "auth"

  def new
    super
  end

  def create
    super
  end

  protected

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end
end
