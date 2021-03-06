class User < ApplicationRecord
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_and_belongs_to_many :groups
  has_many :expenses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

   def self.new_with_session(params, session)
     super.tap do |user|
       if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
         user.email = data['email'] if user.email.blank?
       end
     end
   end

   def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
     end
   end

end
