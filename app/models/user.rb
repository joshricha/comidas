class User < ActiveRecord::Base
  has_many :plans

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:google_oauth2]

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
