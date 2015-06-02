require 'rails_helper'

RSpec.describe Period, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:period)).to be_valid
  end

  context 'validations' do
    it 'requires a starts_at attribute' do
      period = FactoryGirl.build(:period, starts_at: nil)
      expect(period).to_not be_valid
      expect(period.errors[:starts_at]).to include('can\'t be blank')
    end

    it 'requires an ends_at attribute' do
      period = FactoryGirl.build(:period, ends_at: nil)
      expect(period).to_not be_valid
      expect(period.errors[:ends_at]).to include('can\'t be blank')
    end

    it 'has many reports' do
      expect(Period.new).to respond_to(:reports)
      expect(Period.new).to respond_to(:reports=)
    end
  end
end
