class DashboardController < ApplicationController
  before_action :authenticate_user!

  #Admin dashboard
  def index
  end

  #Teacher dashboard
  def home

  end
end
