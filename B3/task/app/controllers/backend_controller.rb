class BackendController < ApplicationController
  def signup
  end

  def index
    if session[:id].nil?
      redirect_to :controller => 'backend', :action => 'signup'
    end
  end

  def confirm
    if params[:commit]
      if params[:name] == "" || params[:password] == ""
        flash.now[:alert] = "用户名或密码不能为空"
        render "signup"
      elsif Admin.create(:name => params[:name], :password => params[:password]).valid?
        flash[:notice] = "注册成功"

        redirect_to :action => :signup
      else
        flash.now[:alert] = "用户名已存在"
        render "signup"
      end
    else
      admin = Admin.find_by_name(params[:name])
      if admin.nil?
        flash.now[:alert] = "无此用户"
        render "signup"
      elsif admin.password == params['password']
        session['id'] = admin.id

        redirect_to :action => :index
      else
        flash.now[:alert] = "密码错误"
        render "signup"
      end
    end
  end

  def posts
    if session[:id]
      admin = Admin.find(session[:id])
      @posts =  admin.posts
    else

      redirect_to :controller => 'backend', :action => 'signup'
    end
  end

  def signout
    session[:id] = nil

    redirect_to :action => :signup
  end
end
