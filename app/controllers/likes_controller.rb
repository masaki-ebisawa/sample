class LikesController < ApplicationController
  def index
    @like_topics = current_user.like_topics
end
