class Api::ProjectsController < ApplicationController
  
  respond_to :json
  before_filter :load_project, only: [:show, :destroy]

  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    render json: @project
  end

  def destroy
    if @project.destroy
      render json: { success: 'Project successfully destroyed' }
    else
      render json: { error: 'Project could not be destroyed' }, status: 422
    end
  end

  private

  def load_project
    @project = Project.find_by_id(params[:id])
    unless @project
      render json: { error: 'Project not found' }, status: 404
    end
  end
end