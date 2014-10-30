# == Schema Information
#
# Table name: recipes
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  cuisine      :string(255)
#  meal_type    :string(255)
#  calories     :integer
#  image_url    :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  instructions :text
#

class Recipe < ActiveRecord::Base
  has_many :plans
  has_many :amounts
  has_many :ingredients, through: :amounts
end
