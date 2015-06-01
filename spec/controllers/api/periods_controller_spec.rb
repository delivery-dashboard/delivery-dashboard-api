require 'rails_helper'

RSpec.describe Api::PeriodsController, type: :controller do

  describe 'GET index' do
    it 'list resources' do
      period1 = FactoryGirl.create(:period)
      period2 = FactoryGirl.create(:period)
      get :index
      expect(assigns(:periods)).to eq([period1, period2])
      expect(response.status).to be 200
    end
  end

  describe 'POST create' do
    context 'valid data' do
      it 'creates resource' do
        period = FactoryGirl.build(:period).attributes
        post :create, period: period
        expect(assigns(:period)).to be_persisted
        expect(response.status).to be 201
      end
    end
    context 'invalid data' do
      it 'does not create resource' do
        post :create, period: { starts_at: nil, ends_at: nil }
        expect(assigns(:period)).to_not be_persisted
        expect(response.status).to be 422
      end
    end
  end

  describe 'DELETE destroy' do
    context 'valid id' do
      it 'destroys resource' do
        period = FactoryGirl.create(:period)
        post :destroy, id: period.id
        result = { success: 'Period successfully destroyed' }.to_json
        expect(response.body).to eql(result)
      end
    end
    context 'invalid id' do
      it 'does not destroy resource' do
        post :destroy, id: 0
        expect(response.body).to eql({ error: 'Period not found' }.to_json)
      end
    end
  end
end
