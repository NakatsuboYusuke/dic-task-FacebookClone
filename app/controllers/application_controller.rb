class ApplicationController < ActionController::Base
  # ヘルパーメソッド
  helper_method :current_user, :logged_in?, :authenticate_user
  before_action :login_required

  # セキュリティトークン
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

end
