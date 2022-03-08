class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @FeedMaterial = Material.all
    @FeedLevel = Level.all
    @FeedCourse = Course.all.order('created_at desc')  and return
  end
end
