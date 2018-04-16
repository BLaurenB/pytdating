class InvitesController < ApplicationController

  def show
# binding.pry
    if params[:email] && params[:add_dater]
      UserMailer.backer_requests_dater(current_backer, params[:email]).deliver_now
      render plain: "ok"

    elsif params[:email] && params[:add_backer]
      UserMailer.dater_requests_backer(current_dater, params[:email]).deliver_now
      render plain: "ok"

    elsif params[:dater_id]
      email = User.find(Dater.find(params[:dater_id]).user_id).email
      UserMailer.backer_requests_dater(current_backer, email).deliver_now
      render plain: "ok"

    elsif params[:backer_id]
      binding.pry
      email = User.find(Backer.find(params[:backer_id]).user_id).email
      UserMailer.dater_requests_backer(current_dater, email).deliver_now
      render plain: "ok"

    else
      render file: 'public/404.html'
    end

  end

end
