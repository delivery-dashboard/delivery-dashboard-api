class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def load_period
    @period = Period.find_by_id(params[:period_id] || params[:id])
    unless @period
      render json: { error: 'Period not found' }, status: 404
    end
  end
end