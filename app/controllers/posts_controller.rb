class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to :back
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :date_begin, :date_end, :employee_skill, :employee_name)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
