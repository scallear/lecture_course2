class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @title = @post.title
    @comment = @post.comments.build(params_comment)
    @comment.creator = User.first

    if @comment.save
      flash[:notice] = "Comment added!"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  private

    def params_comment
      params.require(:comment).permit(:body)
    end

end
