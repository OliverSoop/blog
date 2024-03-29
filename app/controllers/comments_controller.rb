class CommentsController < ApplicationController

	http_basic_authenticate_with :name => "User", :password => "secret", :only => :destroy
 
	def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
		Emailer.comment_added(@post, @comment).deliver
    redirect_to post_path(@post)
  end
	def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
