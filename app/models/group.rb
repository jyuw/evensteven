class Group < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_and_belongs_to_many :users
  has_many :expenses
end
