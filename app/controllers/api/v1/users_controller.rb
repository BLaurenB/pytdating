class Api::V1::UsersController < ApiController

  def index
    if params[:email]
      render json: User.find_by(email: params[:email])
    elsif params[:f_name]
      render json: User.where(f_name: params[:f_name], l_name: params[:l_name])
    else
    render json: User.all
    end
  end

  def show
    render json: User.find(current_user.id)
  end

end
