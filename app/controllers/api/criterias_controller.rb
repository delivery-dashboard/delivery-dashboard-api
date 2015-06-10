class Api::CriteriasController < Api::BaseController
  
  respond_to :json

  def index
    @criterias = Criteria.all
    render json: @criterias
  end
end