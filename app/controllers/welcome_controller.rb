class WelcomeController < ApplicationController
  before_action :current_user_auhenticate?, only: %i[index]

  def index
  end
  
  private
  
  #redirect current_user to feed if signed
  def current_user_auhenticate?
    redirect_to feeds_path if :current_user
   end
end
