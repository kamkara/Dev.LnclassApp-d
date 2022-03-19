class WelcomeController < ApplicationController
  before_action :current_user_auhenticate?, only: %i[index]

  def index
  end
  
  private
    #redirect current_user to feed if signed
    def current_user_auhenticate?
      if :user_signed_in?
        feeds_path
      else
        root_path
      end
   end
  
end
