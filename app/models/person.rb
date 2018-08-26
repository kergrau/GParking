class Person < ApplicationRecord
  validates :dni, uniqueness: true
  after_validation :mayus_minus, :on => [:create, :update]

  private

    def mayus_minus
      self.nombre1 = nombre1.upcase
      self.nombre2 = nombre2.upcase
      self.apellido1 = apellido1.upcase
      self.apellido2 = apellido2.upcase
      self.correo = correo.downcase
      self.direccion = direccion.upcase
    end
end
