class WelcomeController < ApplicationController
  #before_action :current_user_auhenticate?

  def index
   redirect_to feeds_path if :current_user
  end

  #private

  #redirect current_user to feed if signed
  # def current_user_auhenticate?
    
  # end
  
end
