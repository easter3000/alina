class Api::V1::PicturesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_picture, only: [:show, :update, :destroy]

  # GET /api/v1/pictures
  def index
    # @pictures = Project.find(params[:id]).pictures
    @pictures = Picture.all

    # render json: @pictures
  end

  # GET /api/v1/pictures/1
  def show
    @picture
    # render json: @picture
  end

  def new
    @picture = Picture.new
  end

  # POST /api/v1/pictures
  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      redirect_to api_v1_pictures_path
      # render json: @picture, status: :created #, location: @api_v1_picture
    else
      render 'new'
      # render json: @picture.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/pictures/1
  def update
    if @picture.update(picture_params)
      render json: @picture
    else
      render json: @picture.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/pictures/1
  # Удаляем Picture, доступно только admin
  def destroy
    @picture.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def picture_params
      p_params = params.require(:api_v1_picture).permit(:name, :image, :project_id, :user_id, :remove_image)
      p_params.select {|_, p| p.present?}
    end
end
