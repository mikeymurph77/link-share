class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    render :new and return if @post.content.nil?
    @post.save
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
