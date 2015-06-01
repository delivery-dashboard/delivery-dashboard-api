class Api::StatusesController < ApplicationController

  respond_to :json
  before_filter :load_period

  def index
    @statuses = @period.statuses
    render json: @statuses
  end

  def create
    @status = Status.new(status_params)
    @status.period = @period
    if @status.save
      render json: @status, status: 201
    else
      render json: { errors: @status.errors.full_messages }, status: 422
    end
  end

  def update
    @status = Status.find_by_id(params[:id])
    if @status.update(status_params)
      render json: @status, status: 200
    else
      render json: { errors: @status.errors.full_messages }, status: 422
    end
  end

  private
    def status_params
      params.require(:status).permit(:project_id, :criteria_id, :period_id, :status, :comments)
    end
end