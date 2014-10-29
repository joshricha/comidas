# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  recipe_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Plan < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
end
