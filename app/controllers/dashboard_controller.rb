class DashboardController < ApplicationController

  def show
    binding.pry
    if params[:dater]
      dater = Dater.find(params[:dater])
      flash[:notice] = " You are now backing #{dater.f_name.capitalize}!"
    elsif params[:backer]
      requestor = Backer.find(params[:backer])
      flash[:notice] = "#{backer.f_name} has your back"
    end
  end





end
