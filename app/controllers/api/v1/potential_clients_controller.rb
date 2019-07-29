class Api::V1::PotentialClientsController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  before_action :set_potential_client, only: [:show, :destroy]

  # GET /api/v1/potential_clients
  def index
    @potential_clients = PotentialClient.all

    render json: @potential_clients
  end

  # GET /api/v1/potential_clients/1
  def show
    render json: @potential_client
  end

  # POST /api/v1/potential_clients
  def create
    @potential_client = PotentialClient.new(potential_client_params)

    if @potential_client.save
      render json: @potential_client, status: :created #, location: @api_v1_potential_client
      PotentialClientsMailer.with(potential_client: @potential_client).welcome_email.deliver_now
    else
      render json: @potential_client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/potential_clients/1
  def destroy
    @potential_client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_potential_client
      @potential_client = PotentialClient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def potential_client_params
      pc_params = params.require(:api_v1_potential_client).permit(:first_name, :last_name, :email)
      pc_params.select {|_, pc| pc.present?}
    end
end
