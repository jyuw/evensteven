require 'rails_helper'

RSpec.describe User do

  describe "Factory" do
    it "should have a valid factory" do
      expect(FactoryBot.create(:user)).to be_valid
    end
  end

end
