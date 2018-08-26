class Record < ApplicationRecord
  validates :railcars_id, presence: true, uniqueness: { scope: :estado},
  :on => :create
  #before_update :prueba, unless: :estado?, :on => :update
  after_validation :mayus_minus, :on => [:create, :update]

  private

    def mayus_minus
      self.railcars_id = railcars_id.upcase #Envia la placa en mayusculas.
    end
end
