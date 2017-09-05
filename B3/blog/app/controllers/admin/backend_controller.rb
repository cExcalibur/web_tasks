class Admin::BackendController < ApplicationController
  before_action:authorize, :except =>[ :signup, :confirm, :login, :session]

  def signup
  end

  def index
  end

  def register
    if params[:name] == "" || params[:password] == ""
      flash.now[:alert] = "用户名或密码不能为空"
      render "signup"
    elsif Admin.create(:name => params[:name], :password => params[:password]).valid?
      flash[:notice] = "注册成功"

      redirect_to :controller => 'backend' , :action => 'signup'
    else
      flash.now[:alert] = "用户名已存在"
      render "signup"
    end
  end

  def login
  end

  def confirm
    admin = Admin.find_by_name(params[:name])
    password = params[:password]
    if admin && admin.authenticate(password)
      session[:id] = admin.id

      redirect_to :action => 'index'
    else
      flash.now[:alert] = "用户名或密码错误"

      render :action => :login
    end
  end

  def posts
    admin = Admin.find(session[:id])
    @posts =  admin.posts
  end

  def signout
    session[:id] = nil

    redirect_to :action => :signup
  end

end
