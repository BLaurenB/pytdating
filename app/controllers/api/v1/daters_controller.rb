class Api::V1::DatersController < ApiController

  def index
    render json: Dater.all
  end

  def show
    render json: Dater.find(params[:id])
  end

end
