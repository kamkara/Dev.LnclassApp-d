class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @FeedMaterial = Material.all.order('created_at desc')
    @FeedLevel = Level.all.order('created_at desc')
    @FeedCourse = Course.all.order('created_at desc')
  end
end
