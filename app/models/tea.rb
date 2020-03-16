class Tea < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews

  validates :flavor, presence:true  
  validate :not_a_duplicate

  


  def new
  end
end
