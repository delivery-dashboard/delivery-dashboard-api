class Api::ReportsController < Api::BaseController

  respond_to :json
  before_filter :load_period

  def index
    @reports = @period.reports
    render json: @reports
  end

  def create
    @report = Report.new(report_params)
    @report.period = @period
    if @report.save
      render json: @report, status: 201
    else
      render json: { errors: @report.errors.full_messages }, status: 422
    end
  end

  def update
    @report = Report.find_by_id(params[:id])
    if @report.update(report_params)
      render json: @report, status: 200
    else
      render json: { errors: @report.errors.full_messages }, status: 422
    end
  end

  private
    def report_params
      params.require(:report).permit(:project_id, :criteria_id, :period_id, :situation, :comments)
    end
end