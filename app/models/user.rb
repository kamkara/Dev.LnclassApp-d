class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

###############   RELATIONS ###################
  has_many :levels
  has_many :materials
  has_many :courses
  has_many :exercices
  has_many :answers
  has_many :questions
  has_many :results
end
