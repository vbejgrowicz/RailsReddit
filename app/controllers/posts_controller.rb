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

  def new
    render 'new'
  end

  def create
    @post = Post.new(post_params)
    return render 'new' unless @post.save
    redirect_to post_url(@post)
  end

  def edit
    @post = Post.find_by(id: params[:id])
    return render 'edit' unless @post.nil?
    redirect_to posts_url
  end

  def update
    @post = Post.find_by(id: params[:id])
    return render 'edit' unless @post.update(post_params)
    redirect_to post_url(@post)
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
