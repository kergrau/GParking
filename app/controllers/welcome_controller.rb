class WelcomeController < ApplicationController
  def index
    #@records = Record.select(:id, :placa, :estado, :railcar_id, :horainicio,
    #:horafinal).joins("INNER JOIN railcars ON railcars.id = 
    #records.railcar_id").where(estado: true)
    # Record.where(estado: true)
    @records = Railcar.select("records.id", :placa, :estado, :railcar_id, :horainicio,
    :horafinal).joins(:records).where("records.estado", true)
  end

  def sacar_auto
    
  end
end
