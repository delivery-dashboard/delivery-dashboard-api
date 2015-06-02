require 'rails_helper'

RSpec.describe Report, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:report)).to be_valid
  end

  context 'validations' do
    it 'requires a period' do
      report = FactoryGirl.build(:report, period: nil)
      expect(report).to_not be_valid
      expect(report.errors[:period]).to include('can\'t be blank')
    end

    it 'requires a criteria' do
      report = FactoryGirl.build(:report, criteria: nil)
      expect(report).to_not be_valid
      expect(report.errors[:criteria]).to include('can\'t be blank')
    end

    it 'requires a project' do
      report = FactoryGirl.build(:report, project: nil)
      expect(report).to_not be_valid
      expect(report.errors[:project]).to include('can\'t be blank')
    end

    it 'requires a situation' do
      report = FactoryGirl.build(:report, situation: nil)
      expect(report).to_not be_valid
      expect(report.errors[:situation]).to include('can\'t be blank')
    end

    it 'requires a valid situation' do
      report = FactoryGirl.build(:report, situation: 'invalid')
      expect(report).to_not be_valid
      expect(report.errors[:situation]).to include('is not included in the list')
    end

    it 'belongs to period' do
      expect(Report.new).to respond_to(:period)
      expect(Report.new).to respond_to(:period=)
    end

    it 'belongs to criteria' do
      expect(Report.new).to respond_to(:criteria)
      expect(Report.new).to respond_to(:criteria=)
    end

    it 'belongs to project' do
      expect(Report.new).to respond_to(:project)
      expect(Report.new).to respond_to(:project=)
    end

    it 'specifies allowed situations' do
      list = Report::ALLOWED_SITUATIONS
      expect(list.size).to be 5
      expect(list).to include('good')
      expect(list).to include('warning')
      expect(list).to include('danger')
      expect(list).to include('yes')
      expect(list).to include('no')
    end
  end
end
