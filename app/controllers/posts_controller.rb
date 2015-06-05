class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @title = "All Posts"
    @posts = Post.all
  end

  def show
    @title = @post.title
  end

  def new
    @title = "New Post"
    @post = Post.new
  end

  def create
    @post = Post.new(params_post)
    @post.user_id = 1

    if @post.save
      flash[:notice] = "The \"#{@post.title}\" post was created!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @title = @post.title
  end

  def update
    if @post.update(params_post)
      flash[:notice] = "The \"#{@post.title}\" post was updated."
      redirect_to post_path
    else
      render :edit
    end
  end

  private
    def params_post
      params.require(:post).permit(:title, :url, :description)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
