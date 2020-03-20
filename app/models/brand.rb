class Brand < ApplicationRecord
    has_many :teas
    validates :name, presence: true, uniqueness: true
  
    scope :alpha, -> {order(:name)}
   
end