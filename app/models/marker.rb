class Marker < ApplicationRecord
  has_many :category_markers
  has_many :categories, through: :category_markers
  accepts_nested_attributes_for :category_markers, allow_destroy: :true
  # has_and_belongs_to_many :categories
  has_and_belongs_to_many :types

  # accepts_nested_attributes_for :categories, allow_destroy: true
end
