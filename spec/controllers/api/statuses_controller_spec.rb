require 'rails_helper'

RSpec.describe Api::StatusesController, type: :controller do
  
  let(:period) { FactoryGirl.create(:period) }
  let(:status_attributes) { FactoryGirl.build(:status).attributes }

  describe 'GET index' do
    context 'correct parent resource' do
      it 'list resources' do
        status1 = FactoryGirl.create(:status, period: period)
        status2 = FactoryGirl.create(:status, period: period)
        get :index, period_id: period.id
        expect(assigns(:statuses)).to eq([status1, status2])
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
        post :create, period_id: period.id, status: status_attributes
        expect(assigns(:status)).to be_persisted
        expect(assigns(:status).period).to eql period
        expect(response.status).to be 201
      end
    end
    context 'invalid data' do
      it 'does not create resource' do
        post :create, period_id: period.id, status: { status: nil }
        expect(assigns(:status)).to_not be_persisted
        expect(response.status).to be 422
      end
    end
  end

  describe 'PUT update' do
    let(:status) { FactoryGirl.create(:status) }

    context 'valid data' do
      it 'updates resource' do
        put :update, period_id: period.id, id: status.id, status: { comments: 'Test' }
        expect(assigns(:status).comments).to eql 'Test'
        expect(response.status).to be 200
      end
    end

    context 'invalid data' do
      it 'does not update resource' do
        put :update, period_id: period.id, id: status.id, status: { status: nil }
        expect(response.status).to be 422
      end
    end
  end
end
