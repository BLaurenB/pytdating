

class TraitsController < ApplicationController
    def update
      preference =current_dater.trait
      if preference.update(trait_params)
        flash[:notice] = "Your Dater Traits were successfully updated!"
      end
    redirect_to dater_path(current_dater)
    end


    def trait_params
      params[:trait][:height] = feet_inches(params[:height_ft],params[:height_in])
      params.require(:trait).permit(:smoker, :alcohol, :height,:ethnicity,:education,:body_type,:zip,:religion,:religiosity,:political_leaning,:politicalness,:has_kids,:wants_kids,:has_pets,:orientation,:gender, :other)
    end
  end
