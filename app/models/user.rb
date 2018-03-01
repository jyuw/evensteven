class User < ApplicationRecord
  has_and_belongs_to_many :groups
  has_many :expenses, through: :groups
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
