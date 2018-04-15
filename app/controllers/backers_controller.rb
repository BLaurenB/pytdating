class BackersController < ApplicationController

  def index
    @backers = Backer.all
  end

  def show
    @backer = Backer.find(params[:id])
  end

end
