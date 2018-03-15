class TopicsController < ApplicationController
  before_action :load_topics, only: [:show]

  def show
    @topic = Topic.find_by(id: params[:id])
    return redirect_to root_url unless @topic
    render 'show'
  end

  private

  def load_topics
    @topics = Topic.all
  end
end
