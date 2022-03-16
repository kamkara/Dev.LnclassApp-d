class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :Enable_Level, 
                :Enable_Material,
                :Enable_Course,
                :Enable_Exercice
  
 

  def index
    @FeedExercices  =  Exercice.where("course_id =?", @course_id)
  end
  
  private
    def Enable_Course
      @FeedCourses = Course.all.order('created_at desc')
    end
    def Enable_Exercice
      @exercices = Exercice.all.order('created_at asc')
    end
    
    def Enable_Level
      @FeedLevels =  Level.all.order('created_at desc')
    end

    def Enable_Material
      @FeedMaterials =  Material.all.order('created_at desc')
    end
end
