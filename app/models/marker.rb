class Marker < ApplicationRecord
  has_and_belongs_to_many :markers
  has_and_belongs_to_many :types
end
