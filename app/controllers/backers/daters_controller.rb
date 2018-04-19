class Backers::DatersController < ApplicationController

  def index
    @daters = Dater.all
  end

  def show
    @dater = Dater.find(params[:id])
    @dater_backer_id = DaterBacker.find_by(dater_id: @dater.id, backer_id: current_backer.id).id
    @params = params
  end

  def edit
    # binding.pry
    @dater = Dater.find(params[:id])
    @dater_backer_id = DaterBacker.where(dater_id: @dater.id, backer_id: current_backer.id).first.id
    @params = params
    @image = Image.all
  end

  # def edit
  #   @dater = current_dater
  # end

  def update
    binding.pry
    if image_params

# image = Image.create(user_id: "backer's UID", subject: "dater's UID")
# image.update(file: user_params[:image])

      Image.create!(user_id: current_dater.user_id, subject: current_dater.id, file: uploaded_io)
      redirect_to dater_path(current_dater)
    else
    end

    # current_dater.update(dater_params)
  end

  private
    def image_params
      params.require(:dater).permit(:image)
    end



end
