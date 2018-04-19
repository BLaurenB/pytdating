
class PoolController < ApplicationController
  def index
    @dater = Dater.find(params[:id])
    @matches = @dater.matches
    

  end

end
