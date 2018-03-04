require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe "Factory" do
    it "should have a valid factory" do
      expect(create(:expense)).to be_valid
    end
  end

  describe 'db table' do
    it {is_expected.to have_db_column :id}
    it {is_expected.to have_db_column :amount}
    it {is_expected.to have_db_column :description}
  end

  describe 'Associations' do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :group}
  end
end
