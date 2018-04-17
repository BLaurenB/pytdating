class Api::V1::BackersController < ApiController

  def index
    render json: Backer.all
  end

  def show
    render json: Backer.find(params[:id])
  end

end
