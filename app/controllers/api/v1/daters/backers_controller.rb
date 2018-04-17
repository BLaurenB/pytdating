class Api::V1::Daters::BackersController < ApiController

  def index
    #
    render json: Dater.find(params[:id]).backers
  end

  def create
    dater = Dater.find(params[:id])
    dater.backers << Backer.find(params[:backer_id])
    redirect_to "/api/v1/backers/#{params[:backer_id]}"
  end

#don't need a show, just make a call to the actual backers endpoint if needed


  private

    def food_params
      params.require(:backer).permit(:id)
    end

end
