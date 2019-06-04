class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  def self.new_with_session params, session
    super.tap do |user|
      if data = session["devise.facebook_data"] &&
        session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.token = auth.credentials.token
      user.expires_at = auth.credentials.expires_at
    end
  end

  def self.koala(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,picture")
  end

  def self.create_with_omniauth(auth)
    user = find_or_create_by(uid: auth[‘uid’], provider:  auth[‘provider’])
    user.email = “#{auth[‘uid’]}@#{auth[‘provider’]}.com”
    user.password = auth[‘uid’]
    user.name = auth[‘info’][‘name’]
    if User.exists?(user)
      user
    else
      user.save!
      user
    end
  end
end
