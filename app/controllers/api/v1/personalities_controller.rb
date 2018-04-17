class Api::V1::PersonalitiesController < ApiController

  def show
    render json: Personality.find_by(dater_backer_id: params[:id])
  end

  def update
    binding.pry
    personality = Personality.find_by(dater_backer_id: params[:id])

    if personality.update(person_params)
      render json: personality
    else
      render json: personality.errors, status: 400
    end
    # render json: Personality.find_by(dater_backer_id: params[:id])
  end

# def update
#     food = Food.find(params[:id])
#
#     if food.update(food_params)
#       render json: food
#     else
#       render json: food.errors, status: 400
#     end
#   end


  private
  def person_params
    params.require(:personality).permit(:charitable, :intelligent, :shy, :spontaneous, :funny, :adaptable, :confident, :logical, :independent, :organized, :relaxed, :friendly, :energetic, :silly, :patient)
  end

end
