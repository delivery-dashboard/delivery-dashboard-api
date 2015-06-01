class Api::PeriodsController < ApplicationController
  
  respond_to :json

  before_filter :load_period, only: [:destroy]

  def index
    @periods = Period.all
    render json: @periods
  end

  def create
    @period = Period.new(period_params)
    if @period.save
      render json: @period, status: 201
    else
      render json: { errors: @period.errors.full_messages }, status: 422
    end
  end

  def destroy
    if @period.destroy
      render json: { success: 'Period successfully destroyed' }
    else
      render json: { error: 'Period could not be destroyed' }, status: 422
    end
  end

  private
    def period_params
      params.require(:period).permit(:starts_at, :ends_at)
    end
end