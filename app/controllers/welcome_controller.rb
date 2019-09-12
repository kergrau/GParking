class WelcomeController < ApplicationController
  def index
    @records = Record.select(:id, :placa, :estado, :railcar_id, :horainicio,
    :horafinal).joins("INNER JOIN railcars ON railcars.id = 
    CAST(records.railcar_id AS INTEGER)").where(estado: true)
    # Record.where(estado: true)
    # @records = Railcar.select("records.id", :placa, :estado, :railcar_id, :horainicio,
    #:horafinal).joins(:records).where("records.estado", true)
  end

  def schedules
     @parking = Price.select(:hora_inicio, :hora_fin, :tipo_carro, :valor).where(
       estado: true, parking_id: params[:id])
    #@parking = params[:id]
  end
end
