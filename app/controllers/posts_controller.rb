class PostsController < ApplicationController
  def index
    @posts = Post.all
    render 'index'
  end

  def show
    @post = Post.find_by(id: params[:id])
    return redirect_to root_url unless @post
    render 'show'
  end

  def new
    @post = Post.new
    @topics = Topic.all
    render 'new'
  end

  def create
    @post = Post.new(post_params)
    return redirect_to new_post_url unless @post.save
    redirect_to topic_post_url(@post.topic_id, @post)
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @topics = Topic.all
    return render 'edit' unless @post.nil?
    redirect_to root_url
  end

  def update
    @post = Post.find_by(id: params[:id])
    return render 'edit' unless @post.update(post_params)
    redirect_to topic_post_url(@post.topic_id, @post)
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :topic_id)
  end
end
