class Admin::PostsController < ApplicationController
  before_action:authorize

  def index
    admin = Admin.find_by_id(session[:id])
    @posts=admin.posts
  end

  def new
    @post = Post.new
  end

  def create
    admin = Admin.find(session[:id])
    @post = admin.posts.build(post_params)
    if @post.save
      redirect_to admin_posts_path
    else
      @tip="标题或正文不能为空"
      render :action => :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_post_path(@post)
    else
      flash.now[:alert] = "标题或正文不能为空"
      render :action => 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
