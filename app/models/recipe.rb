class Recipe < ActiveRecord::Base
  has_many :plans
  has_many :amounts
  has_many :ingredients, through: :amounts
end
