class WelcomeController < ApplicationController
  before_action :current_user_auhenticate?

  def index
  end

  private

  #redirect current_user to feed if signed
  def current_user_auhenticate?
    if :authenticate_user!
      redirect_to feeds_path 
    end
  end
  
end
