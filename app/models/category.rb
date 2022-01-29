class Category < ApplicationRecord
  has_and_belongs_to_many :markers

  # belongs_to :parent, class_name: "Category", foreign_key: :category_id, optional: :true

  # has_many :subcategories, class_name: "Category", dependent: :destroy

  has_many :subcategories, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  
  belongs_to :parent, class_name: "Category", optional: :true

end
