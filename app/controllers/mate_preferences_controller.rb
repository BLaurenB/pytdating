

class MatePreferencesController < ApplicationController
    def update
      preference =current_dater.mate_preference
      if preference.update(mate_params)
        flash[:notice] = "Your Match preferences were successfully updated"
      end
    redirect_to edit_dater_path(current_dater)
    end


    def mate_params
      params[:mate_preference][:min_height] = feet_inches(params[:min_height_ft],params[:min_height_in])
      params[:mate_preference][:max_height] = feet_inches(params[:max_height_ft],params[:max_height_in])
      params.require(:mate_preference).permit(:smoker, :alcohol, :min_height, :max_height,:ethnicity,:education,:body_type,:zip_radius,:religion,:religiosity,:political_leaning,:politicalness,:has_kids,:wants_kids,:has_pets,:orientation,:gender)
    end
  end
