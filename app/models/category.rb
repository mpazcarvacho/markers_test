class Category < ApplicationRecord
  has_many :category_markers
  has_many :markers, through: :category_markers
  # has_and_belongs_to_many :markers


  has_many :subcategories, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  
  belongs_to :parent, class_name: "Category", optional: :true

  validates :name, presence: true, uniqueness: :true

  # TODO CREATE METHOD TO CHANGE PRIVACY SETTINGS OF CHILDREN
  # after_save :update_privacy
end
