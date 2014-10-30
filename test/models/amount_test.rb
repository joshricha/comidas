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

require 'test_helper'

class AmountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
