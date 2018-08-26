class Railcar < ApplicationRecord
  validates :placa, uniqueness: true
  validates :people_id, presence: true
  after_validation :mayus_minus, :on => [:create, :update]

  private

    def mayus_minus
      self.placa = placa.upcase
      self.modelo = modelo.upcase
      self.marca = marca.upcase
    end
end
