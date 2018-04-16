class InvitesController < ApplicationController

  def show
binding.pry
    if params[:email] && params[:add_dater]
      UserMailer.backer_requests_dater(current_backer, params[:email]).deliver_now
      render plain: "ok"

    elsif params[:email] && params[:add_backer]
      UserMailer.dater_requests_backer(current_dater, params[:email]).deliver_now
      render plain: "ok"

    else
      render file: 'public/404.html'
    end

  end

end
