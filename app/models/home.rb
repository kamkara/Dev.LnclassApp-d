class Home < ApplicationRecord

#############  Request Scope ######
  scope :ready, -> { where("published == false")}
  scope :chrono, -> { order(created_at: :desc)}
  
  #current user completed exercice
    def completed_by(user)
        results.any? {|r| r.user == user}
    end

    #current user grade
    def user_grade(user)
        results.where(user_id: user).first.grade()
    end

    #build result
    def build_result
        r = self.results.build()
        self.questions.each {|q| r.answered_questions.build(question: q)}
        return r
    end

end
