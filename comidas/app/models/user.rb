# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  uid                    :string(255)
#  provider               :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :plans
  # attr_accessor :email, :password, :password_confirmation, :remember_me, :username, :provider, :uid, :avatar


  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:google_oauth2]

  # attr_accessible :email, :password

  # METHODS ---------------------------------------------
  def self.from_omniauth(auth)
    if user = User.find_by(:email => auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
        user = User.new
        user.provider = auth.provider
        user.uid      = auth.uid
        user.name     = auth.info.name
        user.email     = auth.info.email
        user.password = "password"
        user.password_confirmation = "password"
        user.save
        user
    end
  end
end
