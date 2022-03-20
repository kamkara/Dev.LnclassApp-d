class DashboardController < ApplicationController
  before_action :authenticate_user!
 
  #Admin dashboard
  def index
  end

  #Teacher dashboard
  def home
    @LevelList = Level.all.order('created_at desc')
    @MaterialList = Material.all.order('created_at desc')
  end

  
end
