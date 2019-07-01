class ReservationsJob < ApplicationJob
  queue_as :default

  def perform(space_id)
    control_reserva(space_id)
  end

  def control_reserva(space_id)
    reserva = Space.find_by(id: space_id)
    reserva.update(sp_state: true)
  end
end
