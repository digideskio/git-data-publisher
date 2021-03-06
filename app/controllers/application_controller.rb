class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def index
  end


  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def render_404
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
end
