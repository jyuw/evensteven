class User < ApplicationRecord
  has_many :groups
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
