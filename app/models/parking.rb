class Parking < ApplicationRecord
  has_many :prices
  has_many :spaces
end
