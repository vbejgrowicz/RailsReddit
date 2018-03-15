class PostsController < ApplicationController
  before_action :load_topics, only: [:index, :show, :new, :edit]

  def index
    @posts = Post.all.left_joins(:vote).group('posts.id').order('SUM(votes.value) DESC NULLS LAST', 'posts.updated_at DESC')
    render 'index'
  end

  def show
    @post = Post.find_by(id: params[:id])
    return redirect_to root_url unless @post
    render 'show'
  end

  def new
    @post = Post.new(topic_id: params[:topic_id])
    render 'new'
  end

  def create
    @post = Post.new(post_params)
    return redirect_to new_post_url unless @post.save
    redirect_to topic_post_url(@post.topic_id, @post)
  end

  def edit
    @post = Post.find_by(id: params[:id])
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
    redirect_to topic_url(params[:topic_id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :topic_id)
  end

  def load_topics
    @topics = Topic.all
  end
end
