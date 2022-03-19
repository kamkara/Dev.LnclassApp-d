class ApplicationController < ActionController::Base

    # Add sign up params
    protect_from_forgery with: :exception
    #login params
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :find_levels
    #before_action :find_schools
    #before_action :find_cityEreas

   
    def after_sign_in_path_for(resource)
        if current_user.role === "Student"
         feeds_path
        else
         root_path
        end
    end
  
  protected
    # If you have extra params to permit, append them to the sanitizer.
    def configure_permitted_parameters
    sign_up_params          = [ :first_name, :last_name, :full_name, :matricule, :level_name,
                                :material_name, :school_name, :contact, :city_name, :role, :email,
                                :password, :slug, :gender, :payment,
                                :avatar_profil]
                                
    #update_params  = [ :school_name, :status, :avatar_profil, :status_payment]
     
    devise_parameter_sanitizer.permit :sign_up, keys: sign_up_params
      devise_parameter_sanitizer.permit :account_update, keys: sign_up_params
      devise_parameter_sanitizer.permit :sign_in, keys: [:logged, :password]
    end 

    private
      def find_levels
        @levels = Level.all
      end
      def find_schools
        #@schools = School.all
      end
      
      def find_cityEreas
        #@city_ereas = CityErea.all
      end

end
