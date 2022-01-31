class Marker < ApplicationRecord
  has_many :category_markers
  has_many :categories, through: :category_markers, dependent: :destroy
  accepts_nested_attributes_for :category_markers, allow_destroy: :true
  
  has_many :marker_types
  has_many :types, through: :marker_types, dependent: :destroy
  accepts_nested_attributes_for :marker_types, allow_destroy: :true

  validates :title, presence: true
  validates :url, presence: true

  
end
