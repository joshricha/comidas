# == Schema Information
#
# Table name: amounts
#
#  id            :integer          not null, primary key
#  ingredient_id :integer
#  recipe_id     :integer
#  grams         :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Amount < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe
end
