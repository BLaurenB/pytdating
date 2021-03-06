class DatersController < ApplicationController

  def index
    @daters = Dater.all
  end

  def show
    @dater = Dater.find(params[:id])
    @dater_backer_id = DaterBacker.where(dater_id: @dater.id, backer_id: @dater.id).first.id
  end

  def edit
    @dater = current_dater
    @dater_backer_id = DaterBacker.where(dater_id: @dater.id, backer_id: @dater.id).first.id

  end

  # def edit
  #   @dater = current_dater
  # end

  def update
    # binding.pry
    if image_params
        uploaded_io = params[:dater][:image]
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
        end
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
