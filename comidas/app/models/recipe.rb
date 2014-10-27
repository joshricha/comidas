class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :plans
  has_many :amounts
  has_many :ingredients, through: :amounts
end