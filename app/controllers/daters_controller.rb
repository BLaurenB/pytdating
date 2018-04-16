class DatersController < ApplicationController

  def index
    @daters = Dater.all
  end

  def show
    @dater = Dater.find(params[:id])
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
    def traits_params
    end


end
