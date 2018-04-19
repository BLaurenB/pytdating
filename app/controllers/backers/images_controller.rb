class ImagesController < ApplicationController


  def new
  end

  def create
    binding.pry
    # user  = current_user
    # subject =
    image = Image.find()
    image.update(user_params)
    redirect_to dashboard_path
  end



private
  def image_params
    params.require(:image).permit(:subject, :image)
  end

end
