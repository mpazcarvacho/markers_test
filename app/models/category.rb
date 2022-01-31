class Category < ApplicationRecord
  has_many :category_markers
  has_many :markers, through: :category_markers, dependent: :destroy
  # has_and_belongs_to_many :markers


  has_many :subcategories, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  
  belongs_to :parent, class_name: "Category", optional: :true

  # accepts_nested_attributes_for :subcategories_attributes, allow_destroy: :true

  validates :name, presence: true, uniqueness: :true

  # DONE CREATE METHOD TO CHANGE PRIVACY SETTINGS OF CHILDREN
  before_update :change_private

  def change_private
    current_status = self.private
    self.subcategories.each do |s|
      s.private = current_status
      s.save
    end
  end
  
end
