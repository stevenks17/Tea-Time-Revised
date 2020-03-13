class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews
  has_many :reviewed_teas, through: :reviews, source: :tea 
  has_many :teas #user creates this tea

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
