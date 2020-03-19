class Tea < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  accepts_nested_attributes_for :brand
  validates :flavor, presence:true  
  validate :not_a_duplicate

  scope :order_by_rating, ->{left_joins(:reviews).group(:id).order('avg(stars) desc')}

  def self.alpha
    order(:flavor)
  end

  def brand_attributes=(attributes)
    self.brand = Brand.find_or_create_by(attributes) if !attributes['name'].empty?
    self.brand
  end

  def not_a_duplicate
    tea = Tea.find_by(flavor: flavor, brand_id: brand_id)
    if !!tea && tea != self
      errors.add(:flavor, 'has alredy been added for that brand')
    end
  end

  def brand_name
    brand.try(:name)
  end

  def flavor_and_brand
    "#{flavor} - #{brand.try(:name)}"
  end


end
