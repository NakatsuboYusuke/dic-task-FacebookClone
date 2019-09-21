class ApplicationController < ActionController::Base
  # helper method
  helper_method :current_user, :logged_in?, :current_user?, :authenticate_user, :current_user_name
  before_action :login_required
  before_action :login_forbided

  # security token
  protect_from_forgery with: :exception

  private

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
      #@current_user || @current_user = User.find_by(id: session[:user_id])
    end

    def logged_in?
      current_user.present?
    end

    # current_user is false
    def login_required
      redirect_to login_path unless current_user
    end

    # current_user is true
    def login_forbided
      redirect_to pictures_path if current_user
    end

    def current_user_name
      "#{current_user.first_name} #{current_user.last_name}"
    end

    # 404 or 500
    #rescue_from ActiveRecord::RecordNotFound, with: :render_404
    #rescue_from ActionController::RoutingError, with: :render_404
    # if 404 is not catched
    #rescue_from Exception, with: :render_500

    #def render_404
      #render template: 'errors/404', status: 404, layout: 'application', content_type: 'text/html'
    #end

    #def render_500
      #render template: 'errors/500', status: 500, layout: 'application', content_type: 'text/html'
    #end

end
