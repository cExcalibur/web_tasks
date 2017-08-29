class PostsController < ApplicationController
  def index
    if session[:id]
      admin = Admin.find_by_id(session[:id])
      @posts=admin.posts
    else

      redirect_to :controller => 'backend', :action => 'signup'
    end
  end

  def new
    if session[:id]
      @post = Post.new
    else

      redirect_to :controller => 'backend', :action => 'signup'
    end
  end

  def create
    if session[:id]
      admin = Admin.find(session[:id])
      @post = admin.posts.build(post_params)
      if @post.save
        redirect_to posts_path
      else
        @tip="标题或正文不能为空"
        render :action => :new
      end
    else
      redirect_to :controller => 'backend', :action => 'signup'
    end
  end

  def show
    if session[:id]
      @post = Post.find(params[:id])
    else
      redirect_to :controller => 'backend', :action => 'signup'
    end
  end

  def edit
    if session[:id]
      @post = Post.find(params[:id])
    else
      redirect_to :controller => 'backend', :action => 'signup'
    end
  end

  def update
    if session[:id]
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to post_path(@post)
      else
        flash.now[:alert] = "标题或正文不能为空"
        render :action => 'edit'
      end
    else
      redirect_to :controller => 'backend', :action => 'signup'
    end
  end

  def destroy
    if session[:id]
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    else
      redirect_to :controller => 'backend', :action => 'signup'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
