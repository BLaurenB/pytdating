class UsersController < ApplicationController

  # def index -- ONLY FOR ADMINS
  #   @daters = SearchService.new.search(params,current_user)
  #   params = {}
  # end

  # def create
  # end

  def edit

  end

  def update

    user  = current_user
    user.update(user_params)
    redirect_to dashboard_path
  end

  # 
  # def show
  #   # binding.pry
  # end

private
  def user_params
    params.require(:user).permit(:f_name, :l_name, :image)
  end

end
