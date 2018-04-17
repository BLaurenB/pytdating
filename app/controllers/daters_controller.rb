class DatersController < ApplicationController

  def index
    @daters = Dater.all
  end

  def show
    @dater = current_dater
    @dater_backer_id = DaterBacker.where(dater_id: @dater.id, backer_id: @dater.id).first.id
  end

  # def edit
  #   @dater = current_dater
  # end

  # def update
  #
  #   current_dater.update(dater_params)
  # end

  private
    def image_params
      params.require(:dater).permit(:image)
    end



end
