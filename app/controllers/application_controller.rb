class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  def after_sign_in_path_for(resource)
    user_path(current_user.id) #ログイン後のルート先はユーザー詳細画面show
  end
  
  
  def after_sign_out_path_for(resource)
    root_path #ログアウトのルート先はトップページ
  end
  
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
end
