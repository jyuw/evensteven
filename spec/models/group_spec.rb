require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "Factory" do
    it "should have a valid factory" do
      expect(create(:group)).to be_valid
    end
  end

  describe 'db table' do
    it {is_expected.to have_db_column :id}
    it {is_expected.to have_db_column :name}
    it {is_expected.to have_db_column :description}
  end

  describe 'Associations' do
    it {is_expected.to have_and_belong_to_many :users}
    it {is_expected.to have_many :expenses}
  end
end
