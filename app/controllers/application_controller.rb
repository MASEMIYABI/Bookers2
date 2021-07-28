class ApplicationController < ActionController::Base
 before_action :authenticate_user!,except: [:top, :home]

 before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
      user_path(resource)
  end
  def after_sign_up_path_for(resource)
      user_path(resource)
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
#   def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:log_in, keys: [:name])
#   end

end