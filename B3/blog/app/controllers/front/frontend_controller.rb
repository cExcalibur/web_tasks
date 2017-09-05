class Front::FrontendController < ApplicationController
  def index
    @admins = Admin.all
    if params[:id]
      admin = Admin.find(params[:id])
      @posts = admin.posts.page(params[:page]).per(5)
    end
  end

  def post
    @post = Post.find(params[:id])
    @posts = @post.admin.posts
    @comments = @post.comments.where(:pass => 1)
  end

  def comment
    post = Post.find(params[:post])
    if post.comments.create(:content => params[:comment], :pass => 0, :name => params[:name], :email => params[:email]).valid?
      flash[:notice] = "提交成功，正在审核"

      redirect_to :action => 'post', :id => post
    elsif params[:comment] == "" || params[:name] == "" || params[:email] == ""
      flash.now[:alert] = "留言内容、姓名、邮箱不能为空"

      render :post, :locals => { :@post => post, :@posts => post.admin.posts, :@comments => post.comments.where(:pass => 1) }
    else
      flash.now[:alert] = "邮箱格式错误"

      render :post, :locals => { :@post => post, :@posts => post.admin.posts, :@comments => post.comments.where(:pass => 1) }
    end
  end

  def feedback
  end

  def submitfeedback
    if Feedback.create(:content => params[:feedback], :nickname => params[:nickname]).valid?
      flash[:notice] = "提交成功"

      redirect_to :action => 'index'
    else
      flash[:alert] = "反馈内容或昵称不能为空"

      render :feedback
    end
  end
end
