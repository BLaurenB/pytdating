class BackersController < ApplicationController

  def index
    @backers = Backer.all
  end

  def show
    @backer = Backer.find(params[:id])
  
  end

  def edit
  end

  def update
    backer = current_backer
    backer.updater(backer_params)
  end


  private
    def backer_params
      params.require(:backer).permit(:image)
    end
end
