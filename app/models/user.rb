class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, authentication_keys:[:logged]

###############   RELATIONS ###################
  has_many :levels
  has_many :materials
  has_many :courses
  has_many :exercices
  has_many :questions
  has_many :results



  attr_writer :logged
  #enum :role, student: "student", teacher: "teacher", team: "team", default: "student"
  
  ################## VALIDATES  ###############
   before_validation :user_student?,  on: :create
   
  
   validates :first_name, :last_name, :full_name, :email, :password,
              :contact, :role, presence: true
    
   validates :full_name,presence: true,
              format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ },
              length: { minimum:5, maximum: 30,
              message: "%{value} verifier votre nom complet"}

   validates :contact, uniqueness: true, numericality: { only_integer: true }, length: { minimum:10,
              message: "%{ value} verifier votre nom numéro est 10 chiffres"}
              
   validates :role, inclusion: { in: %w(Student Teacher Team),
                    message: "%{value} acces non identifier" }

   ############# CUSTOMIZE ###############""
   
   def user_student?
    if self.role == "Student"
      self.email = "#{self.matricule}@gmail.com" # if user.role == "Student"
      self.password = "#{self.contact}"
    end    
  end

  ################## LOGGED  #########
  def logged
    @logged || self.matricule || self.email
  end

  def user_team?
    if self.role != "Team"
      validates :city_name, presence: true, on: :create
    end
  end

  def full_name
    self.full_name = "#{self.first_name} #{self.last_name}" 
  end  
  
  def slug
    if self.role === "Student"
      self.slug = "civ #{self.full_name} #{self.level_name}"
    elsif self.role === "Teacher"
      self.slug = "civ #{self.full_name} #{self.material_name}"
    elsif self.role === "Team"
      self.slug = "team #{self.full_name}"
    else
      self.slug = "civ #{self.full_name}"
    
    end
  end

  ################## SLUG ###############
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  
  def should_generate_new_friendly_id?
    full_name_changed?
  end

  ################## BEFORE SAVE  #########
  before_save do
    self.contact            = contact.strip.squeeze(" ")
    self.first_name         = first_name.strip.squeeze(" ").downcase.capitalize
    self.last_name          = last_name.strip.squeeze(" ").downcase.capitalize
  end
    
  ################## Logged params  #########

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if logged = conditions.delete(:logged)
      where(conditions.to_h).where(["lower(matricule) = :value OR lower(email) = :value", { :value => logged.downcase }]).first
    elsif conditions.has_key?(:matricule) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
