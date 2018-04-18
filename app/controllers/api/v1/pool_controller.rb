class Api::V1::PoolController < ApiController

  def show
    match = params[:match]
    dater = params[:dater]
    check_for_match  =  Match.find_by(dater_id: dater, match_id: match)

    if check_for_match.nil?
      Match.create(dater_id: dater, match_id: match)
    end
    render plain: "ok"
  end

end
