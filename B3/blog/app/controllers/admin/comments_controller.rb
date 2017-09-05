class Admin::CommentsController < ApplicationController
  before_action:authorize

  def index
    @post = Post.find(params[:id])
    @comments1 = @post.comments.where("pass = ?", 0 )
    @comments2 = @post.comments.where("pass = ?", 1 )
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to  :controller => 'admin/comments', :action => 'index', :id => comment.post
  end

  def pass
    comment = Comment.find(params[:id])
    comment.pass = 1
    comment.save

    redirect_to  :controller => 'admin/comments', :action => 'index', :id => comment.post
  end
end
