class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_admin_user
      flash[:alert] = 'You are not authorized to access this resource!'
      redirect_to root_path
    end
  end

  before_filter :set_search

  def set_search
    @q = Presentation.ransack(params[:q])
    @results = @q.result.includes(:user, :category) if params[:q]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

end
