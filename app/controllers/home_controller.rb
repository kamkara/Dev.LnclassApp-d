class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @FeedMaterials = Material.all.order('created_at desc')
    @FeedLevels = Level.all.order('created_at desc')
    @FeedCourses = Course.all.order('created_at desc')
  end
end
