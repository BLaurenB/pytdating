class DatersController < ApplicationController

  def index
    @daters = Dater.all
  end

  def show
    @dater = Dater.find(params[:id])
  end 

end
