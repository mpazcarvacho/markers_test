class Type < ApplicationRecord
  has_many :marker_types
  has_many :markers, through: :marker_types

  validates :name, presence: true, uniqueness: :true
end
