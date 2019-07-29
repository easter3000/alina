class Api::V1::ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project, only: [:show, :update, :destroy]

  # GET /api/v1/projects
  def index
    @projects = Project

    render json: @projects
  end

  # GET /api/v1/projects/1
  def show
    render json: @project, serializer: ProjectShowSerializer
  end

  # POST /api/v1/projects
  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project, status: :created #, location: @api_v1_project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/projects/1
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/projects/1
  def destroy
    @project.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      u_params = params.require(:api_v1_project).permit(:name, :date_of_creation, :city, :user_id)
      u_params.select {|_, p| p.present?}
    end
end
