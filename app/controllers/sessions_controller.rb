class SessionsController < ApplicationController
  def create
    # binding.pry
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id

    if request.env['omniauth.params']['requestor-dates']

      requestor_id = request.env['omniauth.params']['requestor-dates']
      DaterBacker.create!(dater_id: requestor_id, backer_id: user.id)
      redirect_to "/dashboard?dater=#{requestor_id}"

    elsif request.env['omniauth.params']['requestor-backs']

      requestor_id = request.env['omniauth.params']['requestor-backs']
      DaterBacker.create!(dater_id: user.id, backer_id: requestor_id)
      redirect_to "/dashboard?backer=#{requestor_id}"

    else
      redirect_to dashboard_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
