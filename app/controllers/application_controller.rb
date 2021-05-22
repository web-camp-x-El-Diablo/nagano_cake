class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
  case resource
    when Customer
    products_path
    when Admin
    admin_products_path
  end
  end

  def after_sign_up_path_for(resource)
   root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    return new_admin_session_path if resource_or_scope == :admin
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :postal_code, :address, :telephone_number, :first_name_kana])
  end
end


