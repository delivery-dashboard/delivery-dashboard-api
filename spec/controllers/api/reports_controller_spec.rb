require 'rails_helper'

RSpec.describe Api::ReportsController, type: :controller do
  
  let(:period) { FactoryGirl.create(:period) }
  let(:report_attributes) { FactoryGirl.build(:report).attributes }

  describe 'GET index' do
    context 'correct parent resource' do
      it 'list resources' do
        report1 = FactoryGirl.create(:report, period: period)
        report2 = FactoryGirl.create(:report, period: period)
        get :index, period_id: period.id
        expect(assigns(:reports)).to eq([report1, report2])
        expect(response.status).to be 200
      end
    end

    context 'incorrect parent resource' do
      it 'list resources' do
        get :index, period_id: 0
        expect(response.status).to be 404
      end
    end
  end

  describe 'POST create' do
    context 'valid data' do
      it 'creates resource' do
        post :create, period_id: period.id, report: report_attributes
        expect(assigns(:report)).to be_persisted
        expect(assigns(:report).period).to eql period
        expect(response.status).to be 201
      end
    end
    context 'invalid data' do
      it 'does not create resource' do
        post :create, period_id: period.id, report: { report: nil }
        expect(assigns(:report)).to_not be_persisted
        expect(response.status).to be 422
      end
    end
  end

  describe 'PUT update' do
    let(:report) { FactoryGirl.create(:report) }

    context 'valid data' do
      it 'updates resource' do
        put :update, period_id: period.id, id: report.id, report: { comments: 'Test' }
        expect(assigns(:report).comments).to eql 'Test'
        expect(response.status).to be 200
      end
    end

    context 'invalid data' do
      it 'does not update resource' do
        put :update, period_id: period.id, id: report.id, report: { situation: nil }
        expect(response.status).to be 422
      end
    end
  end
end
