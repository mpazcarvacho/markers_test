class Category < ApplicationRecord
  has_and_belongs_to_many :markers
  has_many :subcategories, class_name: "Category", foreign_key: "subcategory_id", dependent: :destroy
  belongs_to :parent, class_name: "Category", foreign_key: "parent_id"

end
