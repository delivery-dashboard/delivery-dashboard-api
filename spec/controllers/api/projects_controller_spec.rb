require 'rails_helper'

RSpec.describe Api::ProjectsController, type: :controller do
  describe 'GET index' do
    it 'list resources' do
      project1 = FactoryGirl.create(:project)
      project2 = FactoryGirl.create(:project)
      get :index
      expect(assigns(:projects)).to eq([project1, project2])
      expect(response.status).to be 200
    end
  end
end
