class WelcomeController < ApplicationController
  def index
    @records = Record.select(:id, :placa, :estado, :railcars_id, :horainicio,
    :horafinal).joins("INNER JOIN railcars ON railcars.id = 
    records.railcars_id").where(estado: true)
    # Record.where(estado: true)
  end

  def sacar_auto
    
  end
end
