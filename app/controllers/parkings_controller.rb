class ParkingsController < ApplicationController
  def new
    @parking = Parking.new
  end
  def index
  end

  def create
    @parking = Parking.new(parking_params)
    if @parking.save
      render template: '/welcome/index'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_parking
    @person = Person.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def parking_params
    params.require(:parking).permit(:par_name, :par_address, :par_state,
                                    :par_latitude, :par_longitude)
  end
end
