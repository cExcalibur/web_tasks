class CommentsController < ApplicationController
  def index
    if session[:id]
      @post = Post.find(params[:id])
      @comments1 = @post.comments.where("pass = ?", 0 )
      @comments2 = @post.comments.where("pass = ?", 1 )
    else
      redirect_to :controller => 'backend', :action => 'signup'
    end
  end

  def destroy
    if session[:id]
      comment = Comment.find(params[:id])
      comment.destroy

      redirect_to  :controller => 'comments', :action => 'index', :id => comment.post
    else
      redirect_to :controller => 'backend', :action => 'signup'
    end
  end

  def pass
    if session[:id]
      comment = Comment.find(params[:id])
      comment.pass = 1
      comment.save

      redirect_to  :controller => 'comments', :action => 'index', :id => comment.post
    else
      redirect_to :controller => 'backend', :action => 'signup'
    end
  end
end
