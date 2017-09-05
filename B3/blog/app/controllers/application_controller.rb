class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize
    unless session[:id]
      flash[:notice] = "请先登录"

      redirect_to :controller => "admin/backend", :action => "signup"
    end
  end
end
