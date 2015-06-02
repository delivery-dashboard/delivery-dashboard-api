require 'rails_helper'

RSpec.describe Criteria, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:criteria)).to be_valid
  end
end
