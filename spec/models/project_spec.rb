require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:project)).to be_valid
  end
end
