class PostsController < ApplicationController
  def index
    @posts = Post.all
    render 'index'
  end

  def show
    @post = Post.find_by(id: params[:id])
    return redirect_to posts_url unless @post
    render 'show'
  end
end
