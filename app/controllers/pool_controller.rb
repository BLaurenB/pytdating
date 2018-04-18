
class PoolController < ApplicationController
  def index
    @dater = Dater.find(params[:id])
    @matches = @dater.matches

    Dater.find(@matches.first.match_id)
  end

end
